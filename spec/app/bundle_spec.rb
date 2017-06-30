require 'spec_helper'

describe Bundle do
  context '#new' do
    context 'with valid parameters' do
      before do
        @bundle = Bundle.new(quantity: 5, price: 10)
      end

      it 'has a valid quantity' do
        expect(@bundle.quantity).to eq 5
      end

      it 'has a valid price' do
        expect(@bundle.price).to eq 10
      end
    end

    context 'with invalid parameters' do
      it 'raises an error for invalid quantity' do
        expect { Bundle.new(quantity: 'abc', price: 10) }.to raise_error(ArgumentError)
      end

      it 'raises an error for invalid price' do
        expect { Bundle.new(quantity: 15, price: '12.12.1') }.to raise_error(ArgumentError)
      end
    end
  end

  context '#sort' do
    let(:bundle1) { Bundle.new(quantity: 30, price: 1) }
    let(:bundle2) { Bundle.new(quantity: 20, price: 15) }
    let(:bundle3) { Bundle.new(quantity: 10, price: 110) }

    let(:unsorted_bundles) do
      [
        bundle1,
        bundle2,
        bundle3
      ]
    end

    let(:sorted_bundles) do
      [
        bundle3,
        bundle2,
        bundle1
      ]
    end

    it 'sorts bundles by quantity asc' do
      expect(Bundle.sort(unsorted_bundles)).to eq sorted_bundles
    end
  end
end
