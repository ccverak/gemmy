module Gemmy
  class GemStore
    def initialize(args)
      @directory = args[:directory]
    end

    def gems
      Dir.glob("#{@directory}**{,/*/**}/*.gem").each do |file|
        yield file
      end
    end
  end
end