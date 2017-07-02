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
    def bundles_list(bundles)
      list_of_bundles = {}
      bundles.each do |bundle|
        list_of_bundles[bundle.quantity] = bundle.price
      end
      list_of_bundles
    end
  end
end
