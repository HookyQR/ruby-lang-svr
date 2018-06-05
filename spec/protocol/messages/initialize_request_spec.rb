# frozen_string_literal: true

require 'protocol/messages/initialize_request'

RSpec.describe LangSvr::Protocol::Messages::InitializeRequest do
  let(:readable) { %i[method] }
  let(:writeable) { %i[params] }

  include_examples 'protocol component', LangSvr::Protocol::RequestMessage
end
