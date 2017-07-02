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

  context 'bundles_list' do
    let(:bundle1) { Bundle.new(quantity: 30, price: 1) }
    let(:bundle2) { Bundle.new(quantity: 20, price: 15) }
    let(:bundle3) { Bundle.new(quantity: 10, price: 110) }

    let(:bundles) { [bundle1, bundle2, bundle3] }

    let(:list_of_bundles) do
      {
        30 => 1,
        20 => 15,
        10 => 110
      }
    end

    it { expect(Bundle.bundles_list(bundles)).to eq list_of_bundles }
  end
end
