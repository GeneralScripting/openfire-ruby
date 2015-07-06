require 'faraday_middleware/response_middleware'

module FaradayMiddleware
  class ParseOpenfireXml < FaradayMiddleware::ResponseMiddleware

    dependency 'multi_xml'

    define_parser do |body|
      parsed = ::MultiXml.parse(body)
      root = parsed.keys.first
      if parsed[root].nil?
        parsed[root] = []
      else
        parsed[root] = parsed[root].values.first
        if parsed.keys.length == 1
          parsed[root.to_s.pluralize] = parsed.delete(root)
        end
      end
      if root == "error"
        { errors: [parsed["errors"]], data: {} }
      else
        { data: parsed.symbolize_keys }
      end
    end

  end
end