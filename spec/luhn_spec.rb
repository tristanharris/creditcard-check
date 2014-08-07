require_relative '../lib/luhn'

describe Luhn do
  include described_class

  describe 'luhn_valid?' do
    it 'passes a luhn valid string' do
      expect(luhn_valid?('4408041234567893')).to be true
    end

    it 'fails a luhn invalid string' do
      expect(luhn_valid?('4417123456789112')).to be false
    end
  end

  describe 'double_every_other' do
    it 'doubles every other item' do
      in_str = '4408041234567893'.split('').reverse
      out = %w(8 4 0 8 0 4 2 2 6 4 10 6 14 8 18 3).map(&:to_i).reverse
      expect(double_every_other(in_str)).to eq(out)
    end
  end

  describe 'collapse_to_single_digits' do
    it 'adds together the digits of values > 10' do
      data = %w(8 4 0 8 0 4 2 2 6 4 10 6 14 8 18 3).map(&:to_i)
      out = %w(8 4 0 8 0 4 2 2 6 4 1 6 5 8 9 3).map(&:to_i)
      expect(collapse_to_single_digits(data)).to eq(out)
    end
  end

  describe 'generate_total' do
    it 'builds the luhn total' do
      expect(generate_total('4417123456789112')).to eq(69)
    end
  end

end
