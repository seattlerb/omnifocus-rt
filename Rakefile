# -*- ruby -*-

require 'rubygems'
require 'hoe'

Hoe.plugin :seattlerb

s = Hoe.spec 'omnifocus-rt' do
  developer 'aja', 'kushali@rubyforge.org'

  dependency "omnifocus", "~> 2.0"
end

s.rdoc_locations.reject! { |url| url =~ /rubyforge/ } # HACK

# vim: syntax=ruby
