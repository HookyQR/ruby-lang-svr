# frozen-string-literal: true

require 'json'
require_relative 'incoming'
require_relative 'protocol/initialize_result'
require_relative 'protocol/response_message'

module LangSvr
  class LangSvr
    attr_accessor :init_params

    def initialized?
      @initialized
    end

    def initialize(in_stream = STDIN, out_stream = STDOUT, debug = false)
      @incoming = Incoming.new(in_stream, debug)

      @debug = debug
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

    def init(request)
      return default if initialized?
      @initialized = true

      init_params = request.params

      Protocol::ResponseMessage.new(
        id: request.id,
        result: Protocol::InitializeResult.new(
          capabilities: Protocol::ServerCapabilities.new(
            textDocumentSync: 1
          )
        )
      )
    end

    def respond(data)
      data = data.to_s

      STDERR.puts "TX: #{data}" if @debug
      out_stream.write "Content-Length:#{data.bytesize}\r\n"
      out_stream.write "\r\n"
      out_stream.write data
      out_stream.flush
    end

    def resolve(request)
      return respond uninitialized unless initialized? || request.is_a?(Protocol::Messages::InitializeRequest)

      response = process(request)
      respond response
    end

    def process(request)
      case request
      when Protocol::Messages::InitializeRequest then init request
      else default(request.respond_to?(:id ? reques.id : nil))
      end
    end

    def uninitialized
      Protocol::ResponseMessage.new(
        id: nil,
        error: Protocol::ResponseError(
          code: Protocol::ErrorCodes::SERVER_NOT_INITIALIZED
        )
      )
    end

    def default(id)
      Protocol::ResponseMessage.new(
        id: id,
        error: Protocol::ResponseError(
          code: Protocol::ErrorCodes::METHOD_NOT_FOUND
        )
      )
    end
  end
end
