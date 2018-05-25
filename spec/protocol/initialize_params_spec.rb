# frozen_string_literal: true

require 'protocol/initialize_params'

RSpec.describe Protocol::InitializeParams do
  subject(:interface) { described_class.new }

  it { is_expected.to be_a Protocol::Base }

  describe 'interface' do
    subject(:methods) { interface.methods }
    it { is_expected.to include(:processId, :rootPath, :rootUri, :initializationOptions, :capabilities, :trace, :workspaceFolders) }
    it { is_expected.to include(:processId=, :rootPath=, :rootUri=, :initializationOptions=, :capabilities=, :trace=, :workspaceFolders=) }
  end

  describe '#to_s' do
    subject(:string) { interface.to_s }
    before do
      interface.processId = 1
      interface.rootUri = 'document'
      interface.capabilities = Protocol::ClientCapabilities.new
    end

    it { is_expected.to include('"processId":1', '"rootUri":"document"', '"capabilities":{}') }
  end
end
