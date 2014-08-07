module CreditCard

  def self.build(card_number)
    if %w(34 37).include? card_number[0..1]
      AmEx
    elsif card_number.start_with? '6011'
      Discover
    elsif ('51'..'55').include? card_number[0..1]
      MasterCard
    elsif card_number.start_with? '4'
      Visa
    end.new
  end

  class Base
  end

  class AmEx < Base
  end

  class Discover < Base
  end

  class MasterCard < Base
  end

  class Visa < Base
  end

end
