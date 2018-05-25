# frozen-string-literal: true

require 'json'
require_relative 'incoming'

module LangSvr
  class LangSvr
    def initialized?
      @initialized
    end

    def initialize(in_stream = STDIN, out_stream = STDOUT)
      @incoming = Incoming.new(in_stream)

      @out_stream = out_stream
    end

    def run
      loop do
        request = @incoming.message
        break unless request
        if initialized?
          Thread.new { resolve request }
        else
          resolve request
        end
      end
    end

    private

    attr_reader :in_stream, :out_stream

    def init(_request)
      return default if initialized?
      @initialized = true
      ''
    end

    def respond(data)
      out_stream.write "Content-Length: #{data.bytesize}\r\n"
      out_stream.write "\r\n"
      out_stream.write data
    end

    def resolve(request)
      return respond default unless initialized? || request.is_a?(Protocol::Messages::InitializeRequest)

      response = process(request)
      respond response
    end

    def process(request)
      case request
      when Protocol::Messages::InitializeRequest then init request
      else default
      end
    end

    def default
      %({"code":-32002})
    end
  end
end
