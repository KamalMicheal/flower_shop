class Catalogue
  def initialize(flowers)
    @flowers = {}
    flowers.each { |flower| add_flower(flower) }
  end

  def get_flower_by_code(code)
    @flowers[code]
  end

  private

  def add_flower(flower_json)
    @flowers[flower_json.fetch(:code)] = Flower.new(
      name:    flower_json.fetch(:name),
      code:    flower_json.fetch(:code),
      bundles: get_bundles(flower_json.fetch(:bundles))
    )
  end

  def get_bundles(bundles_json)
    bundles_json.map { |bundle| add_bundle(bundle) }
  end

  def add_bundle(bundle_json)
    Bundle.new(
      quantity: bundle_json.fetch(:quantity),
      price:    bundle_json.fetch(:price)
    )
  end
end
