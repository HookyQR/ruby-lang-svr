# frozen_string_literal: true

Dir[File.join('process', 'messages', '*.rb')].each { |file| require file }

module LangSvr
  CRLF = "\r\n"

  class Incoming
    def initialize(in_stream)
      @in_stream = in_stream
    end

    def message
      request = receive
      return unless request&.fetch(:method)

      response = nil
      Protocol::Messages.constants.detect do |name|
        cls = Protocol::Messages.const_get(name)
        response = cls.from_hash(request) if cls::METHOD == request[:method]
      end

      response
    end

    def receive
      return unless (length = read_length)
      return if length.zero?

      content = @in_stream.read(length)
      return unless content

      symbolize_keys(JSON.parse(content))
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

    private

    def symbolize_keys(hash)
      hash.map do |key, value|
        [key.to_sym, value.is_a?(Hash) ? symbolize_keys(value) : value]
      end.to_h
    end
  end
end
