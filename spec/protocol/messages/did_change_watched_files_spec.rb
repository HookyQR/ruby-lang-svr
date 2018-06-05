# frozen_string_literal: true

require 'protocol/messages/did_change_watched_files'

RSpec.describe LangSvr::Protocol::Messages::DidChangeWatchedFiles do
  let(:readable) { %i[method] }
  let(:writeable) { %i[params] }

  include_examples 'protocol component', LangSvr::Protocol::Base
end
