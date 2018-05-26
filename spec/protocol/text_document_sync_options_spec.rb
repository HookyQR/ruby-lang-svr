# frozen_string_literal: true

require 'protocol/text_document_sync_options'

RSpec.describe Protocol::TextDocumentSyncOptions do
  let(:readable) { %i[] }
  let(:writeable) { %i[openClose change willSave willSaveWaitUntil save] }

  include_examples 'protocol component', Protocol::Base
end
