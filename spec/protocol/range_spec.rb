# frozen_string_literal: true

require 'protocol/range'

RSpec.describe LangSvr::Protocol::Range do
  let(:readable) { %i[] }
  let(:writeable) { %i[start end] }

  include_examples 'protocol component', LangSvr::Protocol::Base
end
