class Order
  def initialize
    @items = []
  end

  def add_flower(flower, quantity)
    order_bundles = BundlePicker.new.get_min_bundles(quantity, flower.bundles_as_list.keys)
    raise ArgumentError, "Invalid quantity #{quantity} for #{flower.code}" if order_bundles == {}
    add_item_to_cart flower, quantity, order_bundles
  end

  def checkout
    @items
  end

  private

  def add_item_to_cart(flower, quantity, order_bundles)
    @items << {
      flower: flower.code,
      quantity: quantity,
      bundles: get_bundles_with_price(flower.bundles_as_list, order_bundles),
      total_price: get_total_price(flower.bundles_as_list, order_bundles).round(2)
    }
  end

  def get_total_price(flower_bundles, order_bundles)
    order_bundles.inject(0) do |c, (size, quantity)|
      c + (quantity * flower_bundles[size])
    end
  end

  def get_bundles_with_price(flower_bundles, order_bundles)
    order_bundles.map do |size, quantity|
      {
        quantity: quantity,
        size: size,
        price: flower_bundles[size]
      }
    end
  end
end
