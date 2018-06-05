# frozen_string_literal: true

require 'protocol/text_document_position_params'

RSpec.describe LangSvr::Protocol::TextDocumentPositionParams do
  let(:readable) { %i[] }
  let(:writeable) { %i[textDocument position] }

  include_examples 'protocol component', LangSvr::Protocol::Base
end
