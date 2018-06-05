# frozen_string_literal: true

require 'protocol/text_document_sync_options'

RSpec.describe LangSvr::Protocol::TextDocumentSyncOptions do
  let(:readable) { %i[] }
  let(:writeable) { %i[openClose change willSave willSaveWaitUntil save] }

  include_examples 'protocol component', LangSvr::Protocol::Base
end
