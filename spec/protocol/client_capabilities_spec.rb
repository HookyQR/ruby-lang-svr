# frozen_string_literal: true

require 'protocol/client_capabilities'

RSpec.describe Protocol::ClientCapabilities do
  subject(:client_capabilities) { described_class.new }

  it { is_expected.to be_a Protocol::Base }

  describe 'interface' do
    subject(:methods) { client_capabilities.methods }
    it { is_expected.to include(:workspace, :textDocument, :experimental) }
    it { is_expected.to include(:workspace=, :textDocument=, :experimental=) }
  end

  describe '#to_s' do
    subject(:string) { client_capabilities.to_s }
    before do
      client_capabilities.textDocument = Protocol::TextDocumentClientCapabilities.new
    end

    it { is_expected.to include('"textDocument":{}') }
  end
end
