# frozen_string_literal: true

require_relative 'promotion'

# Model for all type de products and related to Promotion
class Product
  # == Schema Information
  #
  # Table name: product
  #
  #  id                            :uuid             not null, primary key
  #  code                          :string           not null
  #  name                          :string           not null
  #  price                         :string           not null
  #  promotion                     :string
  #  created_at                    :datetime         not null
  #  updated_at                    :datetime         not null
  #

  attr_accessor :name, :code, :price, :promotion

  def initialize(data)
    @code = data[:code]
    @name = data[:name]
    @price = data[:price]
    @promotion = Promotion.new(data[:promotion])
  end
end
