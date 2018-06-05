# frozen_string_literal: true

require 'protocol/versioned_text_document_identifier'

RSpec.describe LangSvr::Protocol::VersionedTextDocumentIdentifier do
  let(:readable) { %i[] }
  let(:writeable) { %i[version] }

  include_examples 'protocol component', LangSvr::Protocol::Base
end
