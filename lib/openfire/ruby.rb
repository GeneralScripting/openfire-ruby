#require 'faraday'

require 'her'
require 'faraday_middleware'
#require 'faraday/request/xml'
require 'faraday_middleware/parse_openfire_xml'
require 'faraday_middleware/parse_openfire_json'

require "openfire/client"
require "openfire/ruby/base"
require "openfire/ruby/group"
require "openfire/ruby/user"
require "openfire/ruby/version"

#Faraday::Request.register_middleware xml: lambda { Faraday::Request::XML }
Faraday::Response.register_middleware openfire_xml: lambda { FaradayMiddleware::ParseOpenfireXml }
Faraday::Response.register_middleware openfire_json: lambda { FaradayMiddleware::ParseOpenfireJson }

module Openfire
  module Ruby
    # nop
  end
end
