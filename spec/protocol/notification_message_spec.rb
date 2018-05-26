# frozen_string_literal: true

require 'protocol/notification_message'

RSpec.describe Protocol::NotificationMessage do
  let(:readable) { %i[] }
  let(:writeable) { %i[method params] }

  include_examples 'protocol component', Protocol::Base
end
