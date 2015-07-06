require 'spec_helper'

describe Openfire::Client do
  let(:client) { Openfire::Client.new('url', 'token') }

  it 'has a constant HER_CLIENT of type Her::API' do
    expect(Openfire::Client::HER_CLIENT).to be_a(Her::API)
  end

  it 'returns class Openfire::Ruby::Group for #groups' do
    expect(client.groups).to be(Openfire::Ruby::Group)
  end

  it 'returns class Openfire::Ruby::User for #users' do
    expect(client.users).to be(Openfire::Ruby::User)
  end

  it 'extends the base_uri with path' do
    client = Openfire::Client.new('http://domain.com:9090', 'token')
    expect(Openfire::Client::HER_CLIENT.base_uri).to eq('http://domain.com:9090/plugins/restapi/v1/')
  end

  it 'extends the base_uri with http' do
    client = Openfire::Client.new('domain.com:9090', 'token')
    expect(Openfire::Client::HER_CLIENT.base_uri).to eq('http://domain.com:9090/plugins/restapi/v1/')
  end

  it 'sets the Authorization header' do
    client = Openfire::Client.new('domain.com:9090', 'thesecrettoken')
    headers = Openfire::Client::HER_CLIENT.connection.headers
    expect(headers).to include('Authorization' => 'thesecrettoken')
  end

  it 'sets the Content-Type header to application/json' do
    client
    headers = Openfire::Client::HER_CLIENT.connection.headers
    expect(headers).to include('Content-Type' => 'application/json')
  end

  it 'sets the Accept header to application/json' do
    client
    headers = Openfire::Client::HER_CLIENT.connection.headers
    expect(headers).to include('Accept' => 'application/json')
  end

end
