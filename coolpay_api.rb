require 'restclient'
require 'json'

USERNAME = 'jones'
API_KEY = 'EE7E4705DD4AC06A'

def add_recipients(recipients)
  uri = 'https://coolpay.herokuapp.com/api/recipients'
  values = '{
    "recipient": {
      "name": "Alice"
    }
  }'
  token = authenticate(USERNAME, 'EE7E4705DD4AC06A')['token']
  headers = {
    "content-type" => "application/json",
    "authorization" => "Bearer #{token}"
  }

  p RestClient.post uri, values, headers
end

def authenticate(username, apikey)
  uri = 'https://coolpay.herokuapp.com/api/login'
  values = '{
    "username": "jones",
    "apikey": "EE7E4705DD4AC06A"
  }'
  headers = {
    "content-type" => "application/json"
  }

  response = RestClient.post(uri, values, headers)
  JSON.parse(response)
end
