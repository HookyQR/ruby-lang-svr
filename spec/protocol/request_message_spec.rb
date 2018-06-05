# frozen_string_literal: true

require 'protocol/request_message'

RSpec.describe LangSvr::Protocol::RequestMessage do
  let(:readable) { %i[] }
  let(:writeable) { %i[id method params] }

  include_examples 'protocol component', LangSvr::Protocol::Message
end
