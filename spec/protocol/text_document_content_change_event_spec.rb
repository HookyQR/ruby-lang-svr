# frozen_string_literal: true

require 'protocol/text_document_content_change_event'

RSpec.describe Protocol::TextDocumentContentChangeEvent do
  let(:readable) { %i[] }
  let(:writeable) { %i[range rangeLength text] }

  include_examples 'protocol component', Protocol::Base
end
