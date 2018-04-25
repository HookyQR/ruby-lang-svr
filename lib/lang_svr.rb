# frozen-string-literal: true

class LangSvr
  attr_accessor :initialized?
  def run
    loop { resolve receive }
  end

  private

  def init(_request)
    return default if initialized?
  end

  def receive; end

  def respond(data); end

  def resolve(request)
    return respond default unless initialized? || request[:method] == :initialize

    Thread.new do
      response = process request
      respond response
    end
  end

  def process(request)
    case request[:method]
    when :initialize then init request
    else default request
    end
  end

  def default
    { code: -32_002 }
  end
end
