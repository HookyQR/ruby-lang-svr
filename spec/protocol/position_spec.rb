# frozen_string_literal: true

require 'protocol/position'

RSpec.describe LangSvr::Protocol::Position do
  let(:readable) { %i[] }
  let(:writeable) { %i[line character] }

  include_examples 'protocol component', LangSvr::Protocol::Base
end
