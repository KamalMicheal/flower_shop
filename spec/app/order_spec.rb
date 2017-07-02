require 'spec_helper'

describe Order do
  context '#add_flower' do
    let(:order) { Order.new }
    let(:flower) { double }
    let(:bundle_picker) { double }

    before do
      allow(BundlePicker).to receive(:new).and_return(bundle_picker)
      allow(bundle_picker).to receive(:get_min_bundles).and_return(min_bundles)
      allow(flower).to receive(:bundles_as_list).and_return(5 => 3, 8 => 5)
      allow(flower).to receive(:code).and_return('test code')
    end

    context 'raises error if quantity cannot be met' do
      let(:min_bundles) { {} }

      it { expect { order.add_flower(flower, 10) }.to raise_error(ArgumentError) }
    end

    context 'adds flower to the list' do
      let(:min_bundles) do
        {
          5 => 2,
          8 => 1
        }
      end

      let(:order_item) do
        {
          flower: flower.code,
          quantity: 18,
          bundles: [
            {
              quantity: 2,
              size: 5,
              price: 3
            },
            {
              quantity: 1,
              size: 8,
              price: 5
            }
          ],
          total_price: 11 # (2 * 3) + (1 * 5)
        }
      end

      before do
        order.add_flower(flower, 18)
      end

      it 'adds flower' do
        expect(order.items.count).to eq 1
      end

      it 'adds item to order items' do
        expect(order.items.first).to eq order_item
      end
    end
  end
end
