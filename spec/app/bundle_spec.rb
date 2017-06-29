require 'spec_helper'

describe Bundle do
  context '#new' do
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
end
