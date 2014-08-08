require_relative '../lib/credit_card'

describe CreditCard do

  describe 'build' do

    context 'with an AmEx number' do

      it 'creates an AmEx card' do
        cc = CreditCard.build '34'
        expect(cc).to be_a CreditCard::AmEx
      end

    end

    context 'with a Discover number' do

      it 'creates a Discover card' do
        cc = CreditCard.build '6011'
        expect(cc).to be_a CreditCard::Discover
      end

    end

    context 'with a MasterCard number' do

      it 'creates a MasterCard' do
        cc = CreditCard.build '51'
        expect(cc).to be_a CreditCard::MasterCard
      end

    end

    context 'with a Visa number' do

      it 'creates a Visa card' do
        cc = CreditCard.build '4'
        expect(cc).to be_a CreditCard::Visa
      end

    end

  end

end
