# frozen_string_literal: true

require 'protocol/messages/did_close'

RSpec.describe LangSvr::Protocol::Messages::DidClose do
  let(:readable) { %i[method] }
  let(:writeable) { %i[params] }

  include_examples 'protocol component', LangSvr::Protocol::Base
end
