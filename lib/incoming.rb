# frozen_string_literal: true

Dir[File.join(__dir__, 'protocol', 'messages', '*.rb')].each { |file| require_relative file }

module LangSvr
  CRLF = "\r\n"

  class UnprocessableData < StandardError; end
  class UnknownMessage < StandardError; end

  class Incoming
    def initialize(in_stream, debug = false)
      @in_stream = in_stream
      @debug = debug
    end

    def message
      request = receive
      return unless request&.fetch(:method)

      response = nil
      Protocol::Messages.constants.detect do |name|
        cls = Protocol::Messages.const_get(name)
        response = cls.from_hash(request) if cls::METHOD == request[:method]
      end

      response || (raise UnknownMessage, request)
    rescue KeyError
      raise UnknownMessage, request
    end

    private

    def receive
      return unless (length = read_length)
      return if length.zero?

      content = @in_stream.read(length)
      return unless content

      STDERR.puts "RX: #{content}" if @debug
      symbolize_keys(JSON.parse(content))
    rescue JSON::ParserError
      raise UnprocessableData, content
    end

    def read_length
      header_line = CRLF
      header_line = @in_stream.gets(CRLF) while header_line == CRLF

      loop do
        length ||= content_length(header_line)
        header_line = @in_stream.gets(CRLF)
        break length if header_line.nil? || header_line == CRLF
      end
    end

    def content_length(header_line)
      header_line.match(/\d+/)&.to_a&.first&.to_i if header_line&.downcase&.start_with?('content-length:')
    end

    def symbolize_keys(hash)
      hash.map do |key, value|
        [key.to_sym, value.is_a?(Hash) ? symbolize_keys(value) : value]
      end.to_h
    end
  end
end
