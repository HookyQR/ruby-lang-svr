# frozen_string_literal: true

require 'protocol/messages/initialized_notification'

RSpec.describe Protocol::Messages::InitializedNotification do
  subject(:interface) { described_class.new }

  it { is_expected.to be_a Protocol::Base }

  describe 'interface' do
    subject(:methods) { interface.methods }

    it { is_expected.to include(:method) }
  end

  describe '#to_s' do
    subject(:string) { interface.to_s }

    it { is_expected.to include('"method":"initialized"') }
  end
end
