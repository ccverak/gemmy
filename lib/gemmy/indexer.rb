module Gemmy
  class GemIndexer

    def initialize(args)
      @geminabox_client = args[:geminabox_client]
      @gem = args[:gem]
    end

    def perform
      @geminabox_client.pub_gem(@gem)
    end
  end


  class DirectoryIndexer

    def initialize(args)
      @geminabox_client = args[:geminabox_client]
      @gem_store = args[:gem_store]
    end

    def perform
      @gem_store.gems do |gem|
        @geminabox_client.pub_gem(gem)
      end
    end
  end
end