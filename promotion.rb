# frozen_string_literal: true

# Model with the description of the promotions
class Promotion
  # == Schema Information
  #
  # Table name: promotion
  #
  #  id                            :uuid             not null, primary key
  #  code                          :string
  #  operation                     :string
  #  value                         :string
  #  created_at                    :datetime         not null
  #  updated_at                    :datetime         not null
  #

  attr_accessor :code, :operation, :value, :minimun

  def initialize(data)
    @code = data[:code]
    @operation = data[:operation]
    @value = data[:value]
    @minimun = data[:minimun]
  end
end
