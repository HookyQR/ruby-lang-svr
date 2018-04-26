# frozen_string_literal: true

require 'lang_svr'

RSpec.describe LangSvr do
  subject(:lang_svr) { described_class.new(in_stream, out_stream) }

  let(:in_stream) { StringIO.new("") }
  let(:out_stream) { StringIO.new }

  describe '.initialized?' do
    subject(:initialized?) { lang_svr.initialized? }

    context 'before init' do
      it { is_expected.to be_falsey }
    end

    context 'after init' do
      let(:in_stream) do
        StringIO.new <<~INIT.gsub(/\r\n|\n/, "\r\n").strip
Content-Length: 112

{"jsonrpc":"2.0","method":"initialize","params":{"processId":1,"rootUri":"file:///root/path","capabilities":{}}}
INIT
      end

      before { lang_svr.run }

      it { is_expected.to be true }
    end
  end

  describe '.run' do
  end
end
