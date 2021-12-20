class Craft
  attr_reader :name,
              :required_supplies

  def initialize(name, required_supplies)
    @name = name
    @required_supplies = required_supplies
  end

end
