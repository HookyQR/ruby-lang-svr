# frozen_string_literal: true

require 'protocol/position'

RSpec.describe Protocol::Position do
  let(:readable) { %i[] }
  let(:writeable) { %i[line character] }

  include_examples 'protocol component', Protocol::Base
end
