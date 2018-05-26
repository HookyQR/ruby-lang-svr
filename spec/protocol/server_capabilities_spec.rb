# frozen_string_literal: true

require 'protocol/server_capabilities'

RSpec.describe Protocol::ServerCapabilities do
  subject(:interface) { described_class.new }

  it { is_expected.to be_a Protocol::Base }

  describe 'interface' do
    subject(:methods) { interface.methods }

    xit { is_expected.to include(:hoverProvider) }
    xit { is_expected.to include(:hoverProvider=) }
  end

  describe '#to_s' do
    subject(:string) { interface.to_s }
    before do
      interface.hoverProvider = false
    end

    it { is_expected.to include('"hoverProvider":false') }
  end
end
