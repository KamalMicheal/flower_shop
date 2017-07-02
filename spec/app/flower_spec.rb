require 'spec_helper'

describe Flower do
  let(:bundles) do
    [
      instance_double(Bundle),
      instance_double(Bundle),
      instance_double(Bundle)
    ]
  end
  let(:flower) { Flower.new(name: 'Rose', code: 'R1', bundles: bundles) }

  describe '#new' do
    context '#initialize' do
      it 'has a name' do
        expect(flower.name).to eq 'Rose'
      end

      it 'has a code' do
        expect(flower.code).to eq 'R1'
      end

      it 'has bundles' do
        expect(flower.bundles).to eq bundles
      end
    end
  end

  describe '#bundles_as_list' do
    it 'expects Bundle to receive bundles_list' do
      expect(Bundle).to receive(:bundles_list)
      flower.bundles_as_list
    end
  end
end
