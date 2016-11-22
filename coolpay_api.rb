require 'restclient'
require 'json'

USERNAME = 'jones'
API_KEY = 'EE7E4705DD4AC06A'

def add_recipients(recipients)
  uri = 'https://coolpay.herokuapp.com/api/recipients'

  recipients.each do |name|
    values = {
      "recipient": {
        "name": name,
      }
    }.to_json
    token = authenticate(USERNAME, API_KEY)['token']
    headers = {
      "content-type" => "application/json",
      "authorization" => "Bearer #{token}"
    }

    RestClient.post uri, values, headers
  end
end

def authenticate(username, apikey)
  uri = 'https://coolpay.herokuapp.com/api/login'
  values = {
    "username": USERNAME,
    "apikey": API_KEY
  }.to_json
  headers = {
    "content-type" => "application/json"
  }

  response = RestClient.post(uri, values, headers)
  p JSON.parse(response)
end

def send_money(recipients)
end
