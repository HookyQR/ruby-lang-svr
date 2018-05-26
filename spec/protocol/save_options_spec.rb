# frozen_string_literal: true

require 'protocol/save_options'

RSpec.describe Protocol::SaveOptions do
  let(:readable) { %i[] }
  let(:writeable) { %i[includeText] }

  include_examples 'protocol component', Protocol::Base
end
