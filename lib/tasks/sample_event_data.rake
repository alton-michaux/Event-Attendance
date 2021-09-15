# frozen_string_literal: true

require 'factory_bot'

module Seeds
  class SampleEvents
    def self.run
      FactoryBot.create_list(:event, 5)
    end
  end
end
