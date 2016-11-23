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

  describe 'verify payment status' do
    context 'paid' do
      it "credits money to recipient's account" do
        david = double(amount: '1567', id: 'f008b3c2-0591-41e1-a6c7-3730345ac02a')

        response = send_money_to david
        verify_remittance_for response

        expect(successful_payment).to be_true
      end
    end
  end
end
