#“Scenario
#
# Coolpay is a new company that allows to easily send money to friends through
# their API.
#
#  You work for Fakebook, a successful social network. You’ve been tasked to
#  integrate Coolpay inside Fakebook. A/B tests show that users prefer to
#  receive money than pokes!
#
#   You can find Coolpay documentation here: http://docs.coolpayapi.apiary.io/
#
#    You will write a small app that uses Coolplay API in Ruby. The app should
#    be able do the following:
#
#     - Authenticate to Coolpay API
#     - Add recipients
#     - Send them money
#     - Check whether a payment was successful
#
#      Username: jones
#      API Key: EE7E4705DD4AC06A
#
#       Once you have completed the app please send it across to us (up to you
#       how you do this - zip attachment, github/bitbucket etc).
#
#        Please let me know if anything is unclear or you need more information
#        regarding this.”

require_relative 'coolpay_api'

RSpec.describe "CoolpayAPI Integration" do
  describe 'authentication' do
    let(:username) { 'jones' }
    let(:apikey) { 'EE7E4705DD4AC06A' }

	  subject { authenticate(username, apikey) }

    context 'success' do
			it { should have_key('token') }
		end
  end

  describe 'add recipients' do
    it 'adds a recipient' do
      expect(add_recipient('alice')).to be_truthy
      expect(add_recipient('bob')).to be_truthy
    end
  end

  describe 'send them money' do
    context 'successful payment' do
      it 'transfers money to recipients' do
        alice = double(name: 'alice', id: 'f008b3c2-0591-41e1-a6c7-3730345ac02a', amount: 200)
        bob = double(name: 'bob', id: '97a5b0c5-ca5e-4134-9cbb-1992d58dd2e2', amount: 3000)

        expect(send_money_to alice).to have_key('payment')
        expect(send_money_to bob).to have_key('payment')
      end
    end

    context 'failed payment' do
      it 'reports an error' do
        garbage = double(id: 'f008b3c2-0591-41e1-a6c7-3730345ac02a', amount: '-29.5d')

        expect{send_money_to garbage}.to raise_error(RestClient::UnprocessableEntity)
      end
    end
  end
end
