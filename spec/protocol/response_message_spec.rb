# frozen_string_literal: true

require 'protocol/response_message'

RSpec.describe LangSvr::Protocol::ResponseMessage do
  let(:readable) { %i[] }
  let(:writeable) { %i[id result error] }

  include_examples 'protocol component', LangSvr::Protocol::Message
end
