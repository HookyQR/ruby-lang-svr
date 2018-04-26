# frozen_string_literal: true

require 'protocol/range'

RSpec.describe Protocol::Range do
  subject(:range) { described_class.new }

  it { is_expected.to be_a Protocol::Base }

  describe 'interface' do
    subject(:methods) { range.methods }
    it { is_expected.to include(:start, :end) }
    it { is_expected.to include(:start=, :end=) }
  end

  describe '#to_s' do
    subject(:string) { range.to_s }
    before do
      range.start = Protocol::Position.new(line: 1, character: 2)
      range.end = Protocol::Position.new(line: 1, character: 2)
    end

    it { is_expected.to match(/"start":\{.*\},"end":\{.*\}/) }
  end
end
