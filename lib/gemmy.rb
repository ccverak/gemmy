require 'listen'
require 'fileutils'
require_relative 'gemmy/version'

module Gemmy


  autoload :Monitor, 'gemmy/monitor'
  autoload :GeminaboxClient, 'gemmy/geminabox_client'
  autoload :GemIndexer, 'gemmy/indexer'
  autoload :DirectoryIndexer, 'gemmy/indexer'
  autoload :GemStore, 'gemmy/gem_store'


  class << self

    attr_accessor(
        :bucket_folder,
        :geminabox_host_url
    )

    def set_defaults(defaults)
      defaults.each do |method, default|
        variable = "@#{method}"
        instance_variable_set(variable, default) unless instance_variable_get(variable)
      end
    end
  end

  set_defaults(
      bucket_folder: File.expand_path(File.join(File.dirname(__FILE__), *%w[.. data bucket])),
      geminabox_host_url: 'http://localhost'
  )
end