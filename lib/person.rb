class Person
  attr_reader :name,
              :interests,
              :supplies

  def initialize(attributes)
    @name = attributes[:name]
    @interests = attributes[:interests]
    @supplies = {}
  end

end
