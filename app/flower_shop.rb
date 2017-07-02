class FlowerShop
  def initialize(flower_json)
    @catalogue = Catalogue.new(flower_json)
  end

  def order(order_items)
    order = Order.new

    order_items.each do |order_item|
      flower = @catalogue.get_flower_by_code(order_item[:code])
      raise ArgumentError, "invalid flower code #{order_item[:code]}" unless flower
      order.add_flower flower, order_item[:quantity]
    end

    order.checkout
  end
end
