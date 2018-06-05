# frozen_string_literal: true

require 'protocol/text_document_client_capabilities'

RSpec.describe LangSvr::Protocol::TextDocumentClientCapabilities do
  let(:readable) { %i[] }
  let(:writeable) do
    %i[synchronization completion hover signatureHelp references documentHighlight] +
      %i[documentSymbol formatting rangeFormatting onTypeFormatting definition] +
      %i[typeDefinition implementation codeAction codeLens documentLink colorProvider] +
      %i[rename publishDiagnostics]
  end

  include_examples 'protocol component', LangSvr::Protocol::Base
end
