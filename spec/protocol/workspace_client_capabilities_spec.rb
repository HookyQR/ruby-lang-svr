# frozen_string_literal: true

require 'protocol/workspace_client_capabilities'

RSpec.describe Protocol::WorkspaceClientCapabilities do
  subject(:ws_client_capabilities) { described_class.new }

  it { is_expected.to be_a Protocol::Base }

  describe 'interface' do
    subject(:methods) { ws_client_capabilities.methods }

    it { is_expected.to include(:applyEdit, :workspaceEdit, :didChangeConfiguration, :symbol, :executeCommand, :workspaceFolders, :configuration) }
    it { is_expected.to include(:applyEdit=, :workspaceEdit=, :didChangeConfiguration=, :symbol=, :executeCommand=, :workspaceFolders=, :configuration=) }
  end

  describe '#to_s' do
    subject(:string) { ws_client_capabilities.to_s }
    before do
      ws_client_capabilities.applyEdit = true
      ws_client_capabilities.executeCommand = { dynamicRegistration: true }
    end

    it { is_expected.to include('"applyEdit":true', '"executeCommand":{"dynamicRegistration":true}') }
  end
end
