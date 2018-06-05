# frozen_string_literal: true

require 'protocol/messages/did_change'

RSpec.describe LangSvr::Protocol::Messages::DidChange do
  let(:readable) { %i[method] }
  let(:writeable) { %i[params] }

  include_examples 'protocol component', LangSvr::Protocol::Base
end
