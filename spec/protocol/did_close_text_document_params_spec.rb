# frozen_string_literal: true

require 'protocol/did_close_text_document_params'

RSpec.describe Protocol::DidCloseTextDocumentParams do
  let(:readable) { %i[] }
  let(:writeable) { %i[textDocument] }

  include_examples 'protocol component', Protocol::Base
end
