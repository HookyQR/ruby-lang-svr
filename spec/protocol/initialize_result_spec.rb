# frozen_string_literal: true

require 'protocol/initialize_result'

RSpec.describe Protocol::InitializeResult do
  let(:readable) { %i[] }
  let(:writeable) { %i[capabilities] }

  include_examples 'protocol component', Protocol::Base
end
