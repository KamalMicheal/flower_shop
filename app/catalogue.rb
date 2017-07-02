class Catalogue
  attr_reader :flowers

  def initialize(flowers)
    @flower = {}
    flowers.each { |flower| add_flower(flower) }
  end

  private

  def add_flower(flower_json)
    @flower[flower_json.fetch(:code)] = Flower.new(
      name:    flower_json.fetch(:name),
      code:    flower_json.fetch(:code),
      bundles: get_bundles(flower_json.fetch(:bundles))
    )
  end

  def get_bundles(bundles_json)
    bundles = bundles_json.map { |bundle| add_bundle(bundle) }
    Bundle.sort bundles
  end

  def add_bundle(bundle_json)
    Bundle.new(
      quantity: bundle_json.fetch(:quantity),
      price:    bundle_json.fetch(:price)
    )
  end
end
