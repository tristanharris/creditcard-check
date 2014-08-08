require_relative '../lib/credit_card'

describe CreditCard::Visa do

  context 'with a card number length of 13' do
    subject { described_class.new '1'*13 }
    it { is_expected.to be_valid_length }
  end

  context 'with a card number length of 16' do
    subject { described_class.new '1'*16 }
    it { is_expected.to be_valid_length }
  end

  context 'with a short card number' do
    subject { described_class.new '1'*12 }
    it { is_expected.to_not be_valid_length }
  end

  context 'with a bad card number length' do
    subject { described_class.new '1'*14 }
    it { is_expected.to_not be_valid_length }
  end

  context 'with a long card number' do
    subject { described_class.new '1'*17 }
    it { is_expected.to_not be_valid_length }
  end

end

