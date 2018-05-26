# frozen_string_literal: true

require 'protocol/initialize_result'

RSpec.describe Protocol::InitializeResult do
  subject(:interface) { described_class.new }

  it { is_expected.to be_a Protocol::Base }

  describe 'interface' do
    subject(:methods) { interface.methods }

    it { is_expected.to include(:capabilities) }
    it { is_expected.to include(:capabilities=) }
  end

  describe '#to_s' do
    subject(:string) { interface.to_s }
    before do
      interface.capabilities = Protocol::ServerCapabilities.new
    end

    it { is_expected.to include('"capabilities":{}') }
  end
end
