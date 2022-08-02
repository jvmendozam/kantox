# frozen_string_literal: true

require_relative '../checkout'
require_relative '../product'
require_relative 'factories/product'
require 'factory_bot'

describe Checkout do
  let(:gr1) { FactoryBot.build(:product, :buy_one_get_one_free) }
  let(:sr1) { FactoryBot.build(:product, :discount_for_bulk) }
  let(:cf1) { FactoryBot.build(:product, :discount_rate) }

  it 'should return the total price of the basket 1' do
    co = Checkout.new({ products: [] })
    co.scan(gr1)
    co.scan(sr1)
    co.scan(gr1)
    co.scan(gr1)
    co.scan(cf1)
    expect(co.total).to eq 22.45
  end

  it 'should return the total price of the basket 2' do
    co = Checkout.new({ products: [] })
    co.scan(gr1)
    co.scan(gr1)
    expect(co.total).to eq 3.11
  end

  it 'should return the total price of the basket 3' do
    co = Checkout.new({ products: [] })
    co.scan(sr1)
    co.scan(sr1)
    co.scan(gr1)
    co.scan(sr1)
    expect(co.total).to eq 16.61
  end

  it 'should return the total price of the basket 4' do
    co = Checkout.new({ products: [] })
    co.scan(gr1)
    co.scan(cf1)
    co.scan(sr1)
    co.scan(cf1)
    co.scan(cf1)
    expect(co.total).to eq 30.57
  end
end
