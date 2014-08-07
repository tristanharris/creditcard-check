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
    end.new card_number
  end

  class Base

    attr_reader :card_number

    def initialize(card_number)
      @card_number = card_number
    end

    def valid_length?
      false
    end

  end

  class AmEx < Base

    def valid_length?
      card_number.length == 15
    end

  end

  class Discover < Base
  end

  class MasterCard < Base
  end

  class Visa < Base
  end

end
