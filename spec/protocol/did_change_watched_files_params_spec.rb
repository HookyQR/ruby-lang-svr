# frozen_string_literal: true

require 'protocol/did_change_watched_files_params'

RSpec.describe LangSvr::Protocol::DidChangeWatchedFilesParams do
  let(:readable) { %i[] }
  let(:writeable) { %i[changes] }

  include_examples 'protocol component', LangSvr::Protocol::Base
end
