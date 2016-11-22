require 'restclient'
require 'json'

USERNAME = 'jones'
API_KEY = 'EE7E4705DD4AC06A'

def add_recipient(recipient)
  uri = 'https://coolpay.herokuapp.com/api/recipients'

  values = {
    "recipient": {
      "name": recipient,
    }
  }.to_json

  token = authenticate(USERNAME, API_KEY)['token']

  headers = {
    "content-type" => "application/json",
    "authorization" => "Bearer #{token}"
  }

  p RestClient.post uri, values, headers
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

def send_money_to(recipient)
  uri = 'https://coolpay.herokuapp.com/api/payments'

  values = {
    "payment": {
      "amount": recipient.amount,
      "currency": "USD",
      "recipient_id": "#{recipient.id}"
    }
  }.to_json

  token = authenticate(USERNAME, API_KEY)['token']

  headers = {
    "content-type" => "application/json",
    "authorization" => "Bearer #{token}"
  }

  response = RestClient.post uri, values, headers
  JSON.parse(response)
end
