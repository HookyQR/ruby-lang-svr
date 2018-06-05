# frozen_string_literal: true

require 'protocol/location'

RSpec.describe LangSvr::Protocol::Location do
  let(:readable) { %i[] }
  let(:writeable) { %i[uri range] }

  include_examples 'protocol component', LangSvr::Protocol::Base
end
