# frozen_string_literal: true

require 'protocol/did_change_configuration_params'

RSpec.describe Protocol::DidChangeConfigurationParams do
  let(:readable) { %i[] }
  let(:writeable) { %i[settings] }

  include_examples 'protocol component', Protocol::Base
end
