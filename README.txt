= omnifocus-rt

home :: https://github.com/seattlerb/omnifocus-rt
rdoc :: http://seattlerb.rubyforge.org/omnifocus-rt

== DESCRIPTION:

Plugin for omnifocus gem to provide rt BTS synchronization.

The first time this runs it creates a yaml file in your home directory
for the rt url, username, password, default queue and query.

The query is optional.  If you don't supply it omnifocus-rt will pull all
tickets from the default queue assigned to the specified user.

The use a custom query you must supply it in the config file.  omnifocus-rt
uses the REST interface to RT.  More information about query formatting is
available here: http://wiki.bestpractical.com/view/REST

Example:

    :rt_url:   rt
    :queue:    QA
    :username: user
    :password: pass
    :query:    "Queue='QA'ANDOwner='Nobody'ANDStatus!='rejected'"


== FEATURES/PROBLEMS:

* Provides rt BTS synchronization.

== REQUIREMENTS:

* omnifocus

== INSTALL:

* sudo gem install omnifocus-rt

== LICENSE:

(The MIT License)

Copyright (c) Aja Hammerly, seattle.rb

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
'Software'), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
