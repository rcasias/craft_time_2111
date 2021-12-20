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

end
