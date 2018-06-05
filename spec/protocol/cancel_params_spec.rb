# frozen_string_literal: true

require 'protocol/cancel_params'

RSpec.describe LangSvr::Protocol::CancelParams do
  let(:readable) { %i[] }
  let(:writeable) { %i[id] }

  include_examples 'protocol component', LangSvr::Protocol::Base
end
