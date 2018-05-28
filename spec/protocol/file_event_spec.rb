# frozen_string_literal: true

require 'protocol/file_event'

RSpec.describe Protocol::FileEvent do
  let(:readable) { %i[] }
  let(:writeable) { %i[type] }

  include_examples 'protocol component', Protocol::Base
end
