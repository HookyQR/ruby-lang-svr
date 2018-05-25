# frozen_string_literal: true

require 'protocol/notification_message'

RSpec.describe Protocol::NotificationMessage do
  subject(:notification_message) { described_class.new }

  it { is_expected.to be_a Protocol::Message }

  describe 'interface' do
    subject(:methods) { notification_message.methods }

    it { is_expected.to include(:method, :params) }
    it { is_expected.to include(:method=, :params=) }
  end

  describe '#to_s' do
    subject(:string) { notification_message.to_s }
    before do
      notification_message.method = 'test'
    end

    it { is_expected.to include('"jsonrpc":"2.0"', '"method":"test"') }
    it { is_expected.not_to include('params') }

    context 'params set' do
      before { notification_message.params = 'paramTest' }

      it { is_expected.to include('"jsonrpc":"2.0"', '"method":"test"', '"params":"paramTest"') }
    end
  end
end
