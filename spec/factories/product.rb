# frozen_string_literal: true

require 'factory_bot'
require_relative 'promotion'

FactoryBot.define do
  factory :product do
    trait :buy_one_get_one_free do
      name { 'Green tea' }
      code { 'GR1' }
      price { 3.11 }
      promotion { attributes_for(:promotion, :buy_one_get_one_free) }
    end

    trait :discount_for_bulk do
      name { 'Strawberries' }
      code { 'SR1' }
      price { 5.00 }
      promotion { attributes_for(:promotion, :discount_for_bulk) }
    end

    trait :discount_rate do
      name { 'Coffee' }
      code { 'CF1' }
      price { 11.23 }
      promotion { attributes_for(:promotion, :discount_rate) }
    end

    initialize_with { new(attributes) }
  end
end
