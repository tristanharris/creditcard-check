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

  describe 'to_s' do
    {
      '4111111111111111'    => 'VISA: 4111111111111111       (valid)',
      '4111111111111'       => 'VISA: 4111111111111          (invalid)',
      '4012888888881881'    => 'VISA: 4012888888881881       (valid)',
      '378282246310005'     => 'AMEX: 378282246310005        (valid)',
      '6011111111111117'    => 'Discover: 6011111111111117   (valid)',
      '5105105105105100'    => 'MasterCard: 5105105105105100 (valid)',
      '5105 1051 0510 5106' => 'MasterCard: 5105105105105106 (invalid)',
      '9111111111111111'    => 'Unknown: 9111111111111111    (invalid)'
    }.each_pair do |card_number, description|
      context "for card number #{card_number}" do
        subject { CreditCard.build card_number }
        it { expect(subject.to_s).to eq(description) }
      end
    end
  end

end
