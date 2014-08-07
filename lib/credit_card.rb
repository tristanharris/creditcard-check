module CreditCard

  def self.build(card_number)
    if %w(34 37).include? card_number[0..1]
      AmEx.new
    elsif card_number.start_with? '6011'
      Discover.new
    elsif ('51'..'55').include? card_number[0..1]
      MasterCard.new
    elsif card_number.start_with? '4'
      Visa.new
    end
  end

  class AmEx
  end

  class Discover
  end

  class MasterCard
  end

  class Visa
  end

end
