# frozen_string_literal: true

module Protocol
  module ErrorCodes
    def self.valid_codes
      @codes ||= constants(false).map { |c| const_get(c) }
    end

    PARSE_ERROR = -32_700
    INVALID_REQUEST = -32_600
    METHOD_NOT_FOUND = -32_601
    INVALID_PARAMS = -32_602
    INTERNAL_ERROR = -32_603
    SERVER_ERROR_START = -32_099
    SERVER_ERROR_END = -32_000
    SERVER_NOT_INITIALIZED = -32_002
    UNKNOWN_ERROR_CODE = -32_001
    REQUEST_CANCELLED = -32_800
  end
end
