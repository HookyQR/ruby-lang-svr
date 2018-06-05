# frozen_string_literal: true

require 'protocol/did_change_text_document_params'

RSpec.describe LangSvr::Protocol::DidChangeTextDocumentParams do
  let(:readable) { %i[] }
  let(:writeable) { %i[textDocument contentChanges] }

  include_examples 'protocol component', LangSvr::Protocol::Base

  describe 'from_hash' do
    it 'accepts arrays' do
      res = described_class.from_hash(
        textDocument: {
          uri: 'doc',
          version: 1
        },
        contentChanges: [
          { text: 'test1' },
          { text: 'test2' },
          { text: 'test3' }
        ]
      )
      expect(res.contentChanges[0]).to be_an_instance_of(LangSvr::Protocol::TextDocumentContentChangeEvent)
    end
  end
end
