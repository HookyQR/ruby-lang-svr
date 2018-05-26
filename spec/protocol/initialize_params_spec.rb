# frozen_string_literal: true

require 'protocol/initialize_params'

RSpec.describe Protocol::InitializeParams do
  let(:readable) { %i[] }
  let(:writeable) { %i[processId rootPath rootUri initializationOptions capabilities trace workspaceFolders] }

  include_examples 'protocol component', Protocol::Base
end
