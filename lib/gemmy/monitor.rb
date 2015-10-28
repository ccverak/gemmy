module Gemmy
  class Monitor



    def initialize(args)
      @location = args[:location]
    end

    def start
      on_change do |modified, added, removed|
        added.each do |file|
          yield file
        end if added
      end
    end

    def on_change(filter = /\.gem$/)
      listener = Listen.to(@location, filter: filter) do |modified, added, removed|
        yield modified, added, removed
      end
      listener.start
    end
  end
end
