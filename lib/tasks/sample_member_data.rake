# frozen_string_literal: true

require 'factory_bot'

module Seeds
  class SampleMembers
    def self.run
      FactoryBot.create_list(:member, 30)
    end
  end
end
