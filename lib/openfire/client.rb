module Openfire
  class Client

    attr_accessor :her_client

    HER_CLIENT = Her::API.new

    def initialize(url, token, options={})
      url.gsub!(/\/$/,'')
      url = "http://#{url}" unless url.match /^http/
      url = "#{url}/plugins/restapi/v1/"
      headers = {
        'Authorization' => token,
        'Content-Type' => 'application/json',
        'Accept' => 'application/json'
      }
      HER_CLIENT.setup url: url, headers: headers do |c|
        c.request :json
        c.response :openfire_xml,  content_type: /^application\/xml$/
        c.response :openfire_json, content_type: /(^application\/json$)|(^$)/
        c.use Faraday::Adapter::NetHttp
      end
    end

    def groups
      @groups ||= Openfire::Ruby::Group
    end

    def users
      @users ||= Openfire::Ruby::User
    end

  end
end
