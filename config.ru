$:.unshift(File.expand_path(File.join(File.dirname(__FILE__), "lib")))
require 'gemmy'
require 'geminabox'

Gemmy.geminabox_host_url = 'http://localhost'
Geminabox.rubygems_proxy = true
run Geminabox::Server