require 'spec_helper'

describe BundlePicker do
  let(:subject) { BundlePicker.new.get_min_bundles(quantity, bundle_sizes) }

  context 'produces empty set for zero quantity' do
    let(:quantity) { 0 }
    let(:bundle_sizes) { [7, 4, 5] }
    it { expect(subject).to eq({}) }
  end

  context 'produces empty set for very low quantity' do
    let(:quantity) { 3 }
    let(:bundle_sizes) { [7, 4, 5] }
    it { expect(subject).to eq({}) }
  end

  context 'produces empty set if quantity cannot be achieved' do
    let(:quantity) { 11 }
    let(:bundle_sizes) { [2, 4, 6] }
    it { expect(subject).to eq({}) }
  end

  context 'produces a list of one item if quantity equals to min bundle size' do
    let(:quantity) { 2 }
    let(:bundle_sizes) { [7, 2, 5] }
    it { expect(subject).to eq(2 => 1) }
  end

  context 'produces min packs' do
    context 'to get 10 of 3,5 you should have 2 x 5' do
      let(:quantity) { 10 }
      let(:bundle_sizes) { [3, 5] }
      it { expect(subject).to eq(5 => 2) }
    end

    context 'to get 10 of 3,5 you should have 5x2' do
      let(:quantity) { 10 }
      let(:bundle_sizes) { [3, 5] }
      it { expect(subject).to eq(5 => 2) }
    end

    context 'to get 14 of 2,5,8 you should have 8x1 & 2x3' do
      let(:quantity) { 14 }
      let(:bundle_sizes) { [2, 5, 8] }
      it { expect(subject).to eq(8 => 1, 2 => 3) }
    end

    context 'to get 13 of 3,5,9 you should have 5x2 & 3x1' do
      let(:quantity) { 13 }
      let(:bundle_sizes) { [3, 5, 9] }
      it { expect(subject).to eq(5 => 2, 3 => 1) }
    end

    context 'to get 8 of 3,5,6,1 you should have 5x1 & 3x1' do
      let(:quantity) { 8 }
      let(:bundle_sizes) { [3, 5, 6, 1] }
      it { expect(subject).to eq(5 => 1, 3 => 1) }
    end
  end
end
