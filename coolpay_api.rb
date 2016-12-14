require 'pry'
require 'restclient'
require 'json'

USERNAME = 'jones'
API_KEY = 'EE7E4705DD4AC06A'
BASE_URI = 'https://coolpay.herokuapp.com/api'

def add_recipient(recipient)
  uri = BASE_URI + '/recipients'

  values = {
    "recipient": {
      "name": recipient,
    }
  }.to_json

  headers = {
    "content-type" => "application/json",
    "authorization" => "Bearer #{token}"
  }

  RestClient.post uri, values, headers
end

def token
  authenticate(USERNAME, API_KEY)['token']
end

def authenticate(username, apikey)
  uri = BASE_URI + '/login'
  values = {
    "username": USERNAME,
    "apikey": API_KEY
  }.to_json

  headers = {
    "content-type" => "application/json"
  }

  response = RestClient.post(uri, values, headers)
  JSON.parse(response)
end

def send_money_to(recipient)
  uri = BASE_URI + '/payments'

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

def verify_remittance_for(new_money_transfer)
  uri = BASE_URI + '/payments'

  token = authenticate(USERNAME, API_KEY)['token']

  headers = {
    "content-type" => "application/json",
    "authorization" => "Bearer #{token}"
  }

  payments = JSON.parse(RestClient.get uri, headers)['payments']
  sleep 5 # waits for payment to be processed
  payments = JSON.parse(RestClient.get uri, headers)['payments']

  latest_payment = payments.select{ |payment| payment['id'] == new_money_transfer['payment']['id'] }.first
  latest_payment['status']
end
