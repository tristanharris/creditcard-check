require_relative '../lib/credit_card'

describe CreditCard::AmEx do

  context 'with a correct card number length' do
    subject { described_class.new '123456789012345' }
    it { is_expected.to be_valid_length }
  end

  context 'with a short card number' do
    subject { described_class.new '12345678901234' }
    it { is_expected.to_not be_valid_length }
  end

  context 'with a long card number' do
    subject { described_class.new '1234567890123456' }
    it { is_expected.to_not be_valid_length }
  end

end

