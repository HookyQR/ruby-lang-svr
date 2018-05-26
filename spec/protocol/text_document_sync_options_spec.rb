# frozen_string_literal: true

require 'protocol/text_document_sync_options'

RSpec.describe Protocol::TextDocumentSyncOptions do
  subject(:interface) { described_class.new }

  it { is_expected.to be_a Protocol::Base }

  describe 'interface' do
    subject(:methods) { interface.methods }

    it { is_expected.to include(:openClose, :change, :willSave, :willSaveWaitUntil, :save) }
    it { is_expected.to include(:openClose=, :change=, :willSave=, :willSaveWaitUntil=, :save=) }
  end

  describe '#to_s' do
    subject(:string) { interface.to_s }
    before do
      interface.openClose = true
      interface.change = 1
    end

    it { is_expected.to include('"openClose":true', '"change":1') }
  end
end
