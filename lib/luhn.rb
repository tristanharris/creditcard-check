module Luhn

  def luhn_valid?(string)
    generate_total(string) % 10 == 0
  end

  def double_every_other(data)
    data.each_with_index.map do |char, index|
      multiplier = index % 2 == 0 ? 1 : 2
      value = char.to_i * multiplier
    end
  end

  def collapse_to_single_digits(data)
    data.map do |value|
      (value / 10) + (value % 10)
    end
  end

  def generate_total(string)
    collapse_to_single_digits(double_every_other(string.reverse.chars)).inject(:+)
  end

end
