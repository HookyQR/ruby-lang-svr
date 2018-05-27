# frozen_string_literal: true

require 'protocol/text_document_item'

RSpec.describe Protocol::TextDocumentItem do
  let(:readable) { %i[] }
  let(:writeable) { %i[languageId version text] }

  include_examples 'protocol component', Protocol::TextDocumentIdentifier
end
