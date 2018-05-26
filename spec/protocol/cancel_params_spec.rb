# frozen_string_literal: true

require 'protocol/cancel_params'

RSpec.describe Protocol::CancelParams do
  let(:readable) { %i[] }
  let(:writeable) { %i[id] }

  include_examples 'protocol component', Protocol::Base
end
