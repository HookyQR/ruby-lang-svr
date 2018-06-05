# frozen_string_literal: true

require 'protocol/initialize_params'

RSpec.describe LangSvr::Protocol::InitializeParams do
  let(:readable) { %i[] }
  let(:writeable) { %i[processId rootPath rootUri initializationOptions capabilities trace workspaceFolders] }

  include_examples 'protocol component', LangSvr::Protocol::Base
end
