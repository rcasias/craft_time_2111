class Person
  attr_reader :name,
              :interests,
              :supplies

  def initialize(attributes)
    @name = attributes[:name]
    @interests = attributes[:interests]
    @supplies = {}
  end

  def add_supply(supply, amount)
    if !@supplies[supply].nil?
      @supplies[supply] += amount
    else
      @supplies[supply] = amount
    end
    @supplies
  end

  def can_build?(craft)
    results = []

    craft.required_supplies.map do |supply, amount|
      if !@supplies.keys.include?(supply.to_s)
        results << false
      elsif !@supplies[supply.to_s].nil? && @supplies[supply.to_s] < amount
        results << false
      else
        results << true
      end
    end

    if results.include?(false)
      return false
    else
      return true
    end
  end

end
