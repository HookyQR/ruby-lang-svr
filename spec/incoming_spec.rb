# frozen_string_literal: true

require 'incoming'
RSpec.describe LangSvr::Incoming do
  subject(:incoming) { described_class.new(in_stream) }

  let(:example_string) { "Content-Length: #{length}\r\n\r\n#{data}" }
  let(:length) { data.length }
  let(:data) { init_request.to_s }
  let(:in_stream) { StringIO.new(example_string) }

  describe '.message' do
    subject(:message) { incoming.message }

    let(:init_request) { Protocol::Messages::InitializeRequest.new(id: 1, params: init_params) }
    let(:init_params) { Protocol::InitializeParams.new(processId: 1, rootUri: nil, capabilities: client_caps) }
    let(:client_caps) { Protocol::ClientCapabilities.new }

    it { is_expected.to be_an_instance_of(Protocol::Messages::InitializeRequest) }

    context 'insufficient data' do
      let(:length) { data.length - 1 }

      it 'fails' do
        expect { message }.to raise_exception(LangSvr::UnprocessableData)
      end
    end

    context 'no stated method' do
      let(:data) { init_request.to_s.gsub(/"method":".*",/, '') }

      it 'fails' do
        expect { message }.to raise_exception(LangSvr::UnknownMessage)
      end
    end

    context 'no matching message type' do
      let(:data) { init_request.to_s.gsub(/"method":".*",/, '"method":"not a real method",') }

      it 'fails' do
        expect { message }.to raise_exception(LangSvr::UnknownMessage)
      end
    end

    context 'junk data' do
      let(:data) { 'something that is not JSON' }

      it 'fails' do
        expect { message }.to raise_exception(LangSvr::UnprocessableData)
      end
    end

    context 'trailing data' do
      let(:data) { init_request.to_s + ' something that is not JSON' }

      it 'fails' do
        expect { message }.to raise_exception(LangSvr::UnprocessableData)
      end
    end
  end
end
