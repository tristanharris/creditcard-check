require_relative '../lib/credit_card'

describe CreditCard::AmEx do

  context 'with a card number length of 15' do
    subject { described_class.new '1'*15 }
    it { is_expected.to be_valid_length }
  end

  context 'with a short card number' do
    subject { described_class.new '1'*14 }
    it { is_expected.to_not be_valid_length }
  end

  context 'with a long card number' do
    subject { described_class.new '1'*16 }
    it { is_expected.to_not be_valid_length }
  end

end

