require 'spec_helper'

describe Catalogue do
  context '#new' do
    let(:flower) { instance_double(Flower) }
    let(:bundle) { instance_double(Bundle) }

    let(:flowers) do
      [
        {
          name: 'Flower 1',
          code: 'F1',
          bundles: [
            {
              quantity: 2,
              price: 5
            },
            {
              quantity: 2,
              price: 5
            }
          ]
        }
      ]
    end

    before do
      allow(Flower).to receive(:new).and_return(flower)
      allow(Bundle).to receive(:new).and_return(bundle)
    end

    let(:subject) { Catalogue.new(flowers) }

    it 'creats flower' do
      expect(Flower).to receive(:new)
      subject
    end

    it 'creates bundles' do
      expect(Bundle).to receive(:new).twice
      subject
    end
  end
end
