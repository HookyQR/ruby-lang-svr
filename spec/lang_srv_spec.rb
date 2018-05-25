# frozen_string_literal: true

require 'lang_svr'

require 'protocol/messages/initialize_request'

RSpec.describe LangSvr::LangSvr do
  subject(:lang_svr) { described_class.new(in_stream, out_stream) }

  let(:in_stream) { StringIO.new('') }
  let(:out_stream) { StringIO.new }

  describe '.initialized?' do
    subject(:initialized?) { lang_svr.initialized? }

    context 'before init' do
      it { is_expected.to be_falsey }
    end

    context 'after init' do
      let(:init_request) { Protocol::Messages::InitializeRequest.new(id: 1, params: init_params).to_s }
      let(:init_params) { Protocol::InitializeParams.new(processId: 1, rootUri: nil, capabilities: client_caps) }
      let(:client_caps) { Protocol::ClientCapabilities.new }
      let(:in_stream) do
        StringIO.new "Content-Length: #{init_request.length}\r\n\r\n#{init_request}"
      end

      before { lang_svr.run }

      it { is_expected.to be true }
    end
  end

  describe '.run' do
    
  end
end
