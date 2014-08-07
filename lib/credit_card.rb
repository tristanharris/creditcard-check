module CreditCard

  def self.build(card_number)
    Visa.new
  end

  class Visa
  end

end
