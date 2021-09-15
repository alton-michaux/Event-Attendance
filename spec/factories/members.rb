# frozen_string_literal: true

require 'faker'
FactoryBot.define do
  factory :member do |f|
    f.first_name { Faker::Name.first_name }
    f.last_name { Faker::Name.last_name }
    f.phone { Faker::Number.number(digits: 10) }
    f.birthday { Faker::Date.birthday(max_age: 65, min_age: 25) }
    f.anniversary { Faker::Date.between(from: '1-1-1980', to: '1-1-2018') }
  end
end
