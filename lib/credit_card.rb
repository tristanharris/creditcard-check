require_relative 'luhn'

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
    else
      Unknown
    end.new card_number
  end

  class Base

    include Luhn

    attr_reader :card_number

    def initialize(card_number)
      @card_number = card_number
    end

    def valid_length?
      false
    end

    def valid?
      valid_length? && luhn_valid?(card_number)
    end

    def to_s
      description = self.class.card_name + ": #{card_number}"
      description + ' ' * (29 - description.length) + (valid? ? '(valid)' : '(invalid)')
    end

  end

  class AmEx < Base

    def self.card_name
      'AMEX'
    end

    def valid_length?
      card_number.length == 15
    end

  end

  class Discover < Base

    def self.card_name
      'Discover'
    end

    def valid_length?
      card_number.length == 16
    end

  end

  class MasterCard < Base

    def self.card_name
      'MasterCard'
    end

    def valid_length?
      card_number.length == 16
    end

  end

  class Visa < Base

    def self.card_name
      'VISA'
    end

    def valid_length?
      card_number.length == 13 || card_number.length == 16
    end

  end

  class Unknown < Base

    def self.card_name
      'Unknown'
    end

    def valid?
      false
    end

  end

end
