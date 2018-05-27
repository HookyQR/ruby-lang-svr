# frozen_string_literal: true

require 'protocol/text_document_identifier'

RSpec.describe Protocol::TextDocumentIdentifier do
  let(:readable) { %i[] }
  let(:writeable) { %i[uri] }

  include_examples 'protocol component', Protocol::Base
end
