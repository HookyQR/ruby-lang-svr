# frozen_string_literal: true

require 'protocol/messages/initialized_notification'

RSpec.describe LangSvr::Protocol::Messages::InitializedNotification do
  let(:readable) { %i[method] }
  let(:writeable) { %i[params] }

  include_examples 'protocol component', LangSvr::Protocol::NotificationMessage
end
