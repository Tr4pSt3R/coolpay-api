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
      alice = double(name: 'alice')
      bob = double(name: 'bob')

      expect(add_recipients([alice, bob])).to be_truthy
    end
  end
end
