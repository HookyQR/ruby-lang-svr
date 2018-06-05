# frozen_string_literal: true

require 'protocol/file_event'

RSpec.describe LangSvr::Protocol::FileEvent do
  let(:readable) { %i[] }
  let(:writeable) { %i[type] }

  include_examples 'protocol component', LangSvr::Protocol::Base
end
