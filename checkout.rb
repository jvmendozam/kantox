# frozen_string_literal: true

require_relative 'services/price_calculation_service'

# Service to buy products and apply discounts.
class Checkout
  # == Schema Information
  #
  # Table name: checkout
  #
  #  id                            :uuid             not null, primary key
  #  product
  #  total                         :float
  #  created_at                    :datetime         not null
  #  updated_at                    :datetime         not null
  #
  attr_accessor :products

  def initialize(data)
    @products = data[:products]
  end

  def scan(new_product)
    products.push(new_product)
  end

  def total
    products.group_by(&:code).sum do |group, list_products|
      PriceCalculationService.calculate_discount(group, list_products)
    end.round(2)
  end
end
