require 'spec_helper'

describe FlowerShop do
  let(:flowers) do
    [
      {
        name: 'Roses',
        code: 'R12',
        bundles: [
          { quantity: 5, price: 6.99 },
          { quantity: 10, price: 12.99 }
        ]
      },
      {
        name: 'Lilies',
        code: 'L09',
        bundles: [
          { quantity: 3, price: 9.95 },
          { quantity: 6, price: 16.95 },
          { quantity: 9, price: 24.95 }
        ]
      },
      {
        name: 'Tulips',
        code: 'T58',
        bundles: [
          { quantity: 3, price: 5.95 },
          { quantity: 5, price: 9.95 },
          { quantity: 9, price: 16.99 }
        ]
      }
    ]
  end
  let(:flower_shop) { FlowerShop.new(flowers) }

  context 'when invalid order arrives' do
    let(:invalid_order_items) do
      [{ code: 'R1', quantity: 5 }]
    end

    it 'should raise an error' do
      expect { flower_shop.order(invalid_order_items) }.to raise_error(ArgumentError)
    end
  end

  context 'when the order items are valid' do
    let(:valid_order_items) do
      [
        { quantity: 10, code: 'R12' },
        { quantity: 15, code: 'L09' },
        { quantity: 13, code: 'T58' }
      ]
    end

    let(:expected_output) do
      [
        {
          flower: 'R12',
          quantity: 10,
          bundles: [{ quantity: 1, size: 10, price: 12.99 }],
          total_price: 12.99
        },
        {
          flower: 'L09',
          quantity: 15,
          bundles: [
            { quantity: 1, size: 9, price: 24.95 },
            { quantity: 1, size: 6, price: 16.95 }
          ],
          total_price: 41.90
        },
        {
          flower: 'T58',
          quantity: 13,
          bundles: [
            { quantity: 2, size: 5, price: 9.95 },
            { quantity: 1, size: 3, price: 5.95 }
          ],
          total_price: 25.85
        }
      ]
    end

    it 'should not raise errors' do
      expect { flower_shop.order(valid_order_items) }.not_to raise_error
    end

    it 'should return the required output' do
      expect(flower_shop.order(valid_order_items)).to eq expected_output
    end
  end
end
