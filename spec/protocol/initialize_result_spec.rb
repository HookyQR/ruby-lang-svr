# frozen_string_literal: true

require 'protocol/initialize_result'

RSpec.describe LangSvr::Protocol::InitializeResult do
  let(:readable) { %i[] }
  let(:writeable) { %i[capabilities] }

  include_examples 'protocol component', LangSvr::Protocol::Base
end
