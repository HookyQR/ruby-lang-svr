# frozen_string_literal: true

require 'protocol/position'

RSpec.describe Protocol::Position do
  subject(:position) { described_class.new }

  it { is_expected.to be_a Protocol::Base }

  describe 'interface' do
    subject(:methods) { position.methods }

    it { is_expected.to include(:line, :character) }
    it { is_expected.to include(:line=, :character=) }
  end

  describe '#to_s' do
    subject(:string) { position.to_s }
    before do
      position.line = 1
      position.character = 2
    end

    it { is_expected.to include('"line":1', '"character":2') }
  end
end
