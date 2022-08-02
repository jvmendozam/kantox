# frozen_string_literal: true

# Service to calculate the prices
class PriceCalculationService
  class << self
    def calculate_discount(_group, list_products)
      price, promotion = products_details(list_products)
      not_discounted_products = (list_products.count % promotion.minimun)
      discounted_products = list_products.count - not_discounted_products
      not_discounted_price = not_discounted_products * price

      return not_discounted_price if discounted_products.zero?

      (discounted_products * price).send(promotion.operation, promotion.value) + not_discounted_price
    end

    def products_details(list_products)
      [list_products.first.price, list_products.first.promotion]
    end

    # Global discount for all products
    def additional_discount
      # TODO
    end
  end
end
