# frozen_string_literal: true

require 'protocol/text_document_client_capabilities'

RSpec.describe Protocol::TextDocumentClientCapabilities do
  subject(:interface) { described_class.new }

  it { is_expected.to be_a Protocol::Base }

  describe 'interface' do
    subject(:methods) { interface.methods }
    it do
      is_expected.to include(
        :synchronization, :completion, :hover, :signatureHelp, :references, :documentHighlight,
        :documentSymbol, :formatting, :rangeFormatting, :onTypeFormatting, :definition,
        :typeDefinition, :implementation, :codeAction, :codeLens, :documentLink, :colorProvider,
        :rename, :publishDiagnostics
      )
    end

    it do
      is_expected.to include(
        :synchronization=, :completion=, :hover=, :signatureHelp=, :references=, :documentHighlight=,
        :documentSymbol=, :formatting=, :rangeFormatting=, :onTypeFormatting=, :definition=,
        :typeDefinition=, :implementation=, :codeAction=, :codeLens=, :documentLink=, :colorProvider=,
        :rename=, :publishDiagnostics=
      )
    end
  end

  describe '#to_s' do
    subject(:string) { interface.to_s }
    before do
      interface.synchronization = { dynamicRegistration: true, didSave: true }
    end

    it { is_expected.to include('"synchronization":{"dynamicRegistration":true,"didSave":true}') }
  end
end
