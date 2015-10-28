$:.unshift(File.expand_path(File.join(File.dirname(__FILE__), "lib")))
require "geminabox"

Geminabox.rubygems_proxy = true
Geminabox.data = ''
run Geminabox::Server
