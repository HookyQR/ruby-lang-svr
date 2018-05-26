# frozen_string_literal: true

require 'protocol/messages/cancel_request'

RSpec.describe Protocol::Messages::CancelRequest do
  let(:readable) { %i[method] }
  let(:writeable) { %i[params] }

  include_examples 'protocol component', Protocol::NotificationMessage
end
