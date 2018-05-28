# frozen_string_literal: true

require 'protocol/did_save_text_document_params'

RSpec.describe Protocol::DidSaveTextDocumentParams do
  let(:readable) { %i[] }
  let(:writeable) { %i[textDocument] }

  include_examples 'protocol component', Protocol::Base
end
