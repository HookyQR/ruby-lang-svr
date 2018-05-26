# frozen_string_literal: true

require 'protocol/save_options'

RSpec.describe Protocol::SaveOptions do
  subject(:interface) { described_class.new }

  it { is_expected.to be_a Protocol::Base }

  describe 'interface' do
    subject(:methods) { interface.methods }

    it { is_expected.to include(:includeText) }
    it { is_expected.to include(:includeText=) }
  end

  describe '#to_s' do
    subject(:string) { interface.to_s }
    before do
      interface.includeText = true
    end

    it { is_expected.to include('"includeText":true') }
  end
end
