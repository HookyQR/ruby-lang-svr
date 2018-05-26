# frozen_string_literal: true

require 'protocol/range'

RSpec.describe Protocol::Range do
  let(:readable) { %i[] }
  let(:writeable) { %i[start end] }

  include_examples 'protocol component', Protocol::Base
end
