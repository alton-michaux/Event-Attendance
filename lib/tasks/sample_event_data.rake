require 'factory_bot'
require 'spec/factories/events'

module Seeds

  class SampleEvents

    def self.run
    u = Factory(:event)
  end
end
