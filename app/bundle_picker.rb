class BundlePicker
  # This class is responsible for implementing the logic to get the min number of bundles
  # for a given quantity from a given array of bundles.

  def initialize
    # This instance variable holds all possible combinations of bundles to produce
    # the given quantity
    @possible_combinations = []
  end

  def get_min_bundles(quantity, bundle_sizes)
    return {} if quantity.zero? || bundle_sizes.empty?

    get_all_possible_bundles quantity, bundle_sizes.sort.reverse

    return {} if @possible_combinations.empty?

    sort_bundles_by_count.first
  end

  private

  def get_all_possible_bundles(quantity, bundle_sizes, bundle_cart = {})
    # this is a recursive method responsible for getting all possible combinations
    # of bundles for a given quantity
    if quantity.zero?
      # Quantity is met. add this combination to all possible combinations
      @possible_combinations << bundle_cart
      return
    end

    # quantity can't be achieved from this path
    return if quantity < bundle_sizes.last

    bundle_sizes.each do |bundle_size|
      next if quantity < bundle_size

      # keep adding bundles till you meet the quantity or exceed
      get_all_possible_bundles quantity - bundle_size,
                               remove_bundles_with_bigger_quantities(bundle_sizes, bundle_size),
                               add_to_bundle_cart(bundle_cart, bundle_size)
    end
  end

  def add_to_bundle_cart(bundle_cart, bundle_size)
    cart_copy = bundle_cart.clone
    cart_copy[bundle_size] = cart_copy.keys.include?(bundle_size) ? cart_copy[bundle_size] + 1 : 1
    cart_copy
  end

  def remove_bundles_with_bigger_quantities(bundle_sizes, curent_size)
    # This method will enhance performance by removing un-necessary iterations
    bundle_sizes.select { |bs| bs <= curent_size }
  end

  def get_bundles_count(bundle_list)
    # return number of bundles from a given hash
    bundle_list.values.inject(0, :+)
  end

  def sort_bundles_by_count
    @possible_combinations.sort_by { |combination| get_bundles_count(combination) }
  end
end
