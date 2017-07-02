class Flower
  attr_reader :name, :code, :bundles

  def initialize(name:, code:, bundles:)
    @name = name
    @code = code
    @bundles = bundles
  end

  def bundles_as_list
    Bundle.bundles_list(bundles)
  end
end
