require 'open-uri'

module OmniFocus::Rt
  VERSION = '1.0.0'
  PREFIX  = "RM"

   def load_or_create_rt_config
     path   = File.expand_path "~/.omnifocus-rt.yml"
     config = YAML.load(File.read(path)) rescue nil

     unless config then
       config = {
         :username => "USERNAME",
         :password => "PASSWORD",
         :rt_url   => "tickets.mysite.com",
         :queue    => "MyQueue"
       }

       File.open(path, "w") { |f|
         YAML.dump(config, f)
       }

       abort "Created default config in #{path}. Go fill it out."
     end

     config
   end

  def populate_rt_tasks
    config        = load_or_create_rt_config
    rt_url        = config[:rt_url]
    username      = config[:username]
    password      = config[:password]
    queue         = config[:queue]
    default_query = "Owner='#{username}'ANDqueue=#{queue}"
    query         = config[:query] || default_query

    auth      = "user=#{username}&pass=#{password}"
    query_url = "http://#{rt_url}/REST/1.0/search/ticket?query=#{query}&#{auth}"

    html = URI.parse(query_url).read
    lines = html.split(/\n/)

    lines.each do |line|
      bug_number = line[/(\d+):(.*)/, 1]
      next unless bug_number
      ticket_id = "#{PREFIX}##{bug_number}"

      if existing[ticket_id] then
        project = existing[ticket_id]
        bug_db[project][ticket_id] = true
      else
        url = "http://#{rt_url}/Ticket/Display.html?id=#{bug_number}"
        title = $2
        details_url = "http://#{rt_url}/REST/1.0/ticket/#{bug_number}/show?#{auth}"
        details = URI.parse(details_url).read
        project = details[/Queue: ([\w-]+)/, 1]

        bug_db[project][ticket_id] = ["#{ticket_id}: #{title}", url]
      end
    end
  end
end
