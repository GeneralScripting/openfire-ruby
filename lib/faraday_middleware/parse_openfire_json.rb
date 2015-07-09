require 'faraday_middleware/response_middleware'

module FaradayMiddleware
  class ParseOpenfireJson < FaradayMiddleware::ResponseMiddleware

    dependency do
      require 'json' unless defined?(::JSON)
    end

    define_parser do |body|
      if body.strip.empty?
        { data: {}, errors: [] }
      else
        parsed = ::JSON.parse body
        case parsed.keys.length
        when 0
          parsed = []
        when 1
          parsed = parsed.values.first
        end

        if parsed.is_a?(Hash)
          { data: parsed.symbolize_keys }
        else
          { data: parsed }
        end
      end
    end

  end
end
