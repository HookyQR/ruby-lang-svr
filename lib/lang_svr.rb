# frozen-string-literal: true

require 'json'

class LangSvr
  def initialized?
    @initialized
  end

  def initialize(in_stream = STDIN, out_stream = STDOUT)
    @in_stream = in_stream
    @out_stream = out_stream
  end

  def run
    loop do
      request = receive
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
    ""
  end

  def content_length(header_line)
    header_line.match(/(\d+)/)[1].to_i if header_line.downcase.start_with? 'content-length:'
  end

  def read_length
    length = nil
    loop do
      header_line = in_stream.gets("\r\n")&.strip
      return unless header_line # that's bad
      break if header_line.empty? # protocol header complete

      length ||= content_length(header_line)
    end

    length
  end

  def receive
    return unless length = read_length
    return {} unless length > 0

    data = in_stream.read(length)

    return unless data

    JSON.parse(data)
  end

  def respond(data)
    out_stream.write "Content-Length: #{data.bytesize}\r\n"
    out_stream.write "\r\n"
    out_stream.write data
  end

  def resolve(request)
    return respond default unless initialized? || request['method'] == 'initialize'

    response = process request
    respond response
  end

  def process(request)
    case request['method']
    when 'initialize' then init request
    else default
    end
  end

  def default
    %Q({"code":-32002})
  end
end
