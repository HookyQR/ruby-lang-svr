# frozen_string_literal: true

require 'protocol/notification_message'

RSpec.describe LangSvr::Protocol::NotificationMessage do
  let(:readable) { %i[] }
  let(:writeable) { %i[method params] }

  include_examples 'protocol component', LangSvr::Protocol::Base
end
