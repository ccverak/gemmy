module Gemmy
  class GeminaboxClient

    def initialize(args)
      @host = args[:host]
    end

    def pub_gem(file)
      success = system("gem inabox #{file} --host #{@host}")
      raise StandardError.new("An error has occurred while publishing the gem #{file}") unless success
    end
  end
end