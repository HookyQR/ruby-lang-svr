# frozen_string_literal: true

require 'protocol/location'

RSpec.describe Protocol::Location do
  subject(:location) { described_class.new }

  it { is_expected.to be_a Protocol::Base }

  describe 'interface' do
    subject(:methods) { location.methods }

    it { is_expected.to include(:uri, :range) }
    it { is_expected.to include(:uri=, :range=) }
  end

  describe '#to_s' do
    subject(:string) { location.to_s }
    before do
      location.uri = 'document'
      location.range = Protocol::Range.new(
        start: Protocol::Position.new(line: 1, character: 2),
        end:   Protocol::Position.new(line: 3, character: 4)
      )
    end

    it { is_expected.to match(/"uri":"document","range":\{.*\}/) }
  end
end
