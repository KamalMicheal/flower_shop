class Bundle
  attr_reader :quantity, :price

  def initialize(quantity:, price:)
    validate_params quantity, price
    @quantity = Integer(quantity)
    @price = Float(price)
  end

  private

  def validate_params(quantity, price)
    raise ArgumentError, "invalid bundle arguemnt" unless quantity.is_a?(Numeric) && price.is_a?(Numeric)
  end

  class << self
    def sort(bundles)
      bundles.sort_by(&:quantity)
    end
  end
end
