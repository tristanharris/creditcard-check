require_relative '../lib/credit_card'

describe CreditCard, 'build' do

  context 'with a visa number' do

    it 'creates a Visa card' do
      cc = CreditCard.build('4')
      expect(cc).to be_a CreditCard::Visa
    end

  end

end
