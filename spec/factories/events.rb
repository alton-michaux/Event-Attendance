# frozen_string_literal: true

require 'faker'

FactoryBot.define do
  factory :event do |f|
    f.description do
      ['PotLuck', 'Book Club', 'Leadership Conference', 'Homecoming', 'Team Brunch', 'Meditation',
       'Birthday Party'].sample
    end
    f.frequency { %w[Daily Weekly Monthly Annually].sample }
    f.start_time { Faker::Date.backward(days: 1) }
    f.end_time { Faker::Date.forward(days: 730) }
    f.event_location { Faker::Address.street_address }
    f.members do
      FactoryBot.create_list(:member, 5)
    end
  end
end
