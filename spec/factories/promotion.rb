# frozen_string_literal: true

require 'factory_bot'

FactoryBot.define do
  factory :promotion do
    trait :buy_one_get_one_free do
      code { 'PO1' }
      operation { '*' }
      value { 0.5 }
      minimun { 2 }
    end

    trait :discount_for_bulk do
      code { 'PO2' }
      operation { '-' }
      value { 1.5 }
      minimun { 3 }
    end

    trait :discount_rate do
      code { 'PO3' }
      operation { '*' }
      value { 2/3r }
      minimun { 3 }
    end

    initialize_with { new(attributes) }
  end
end
