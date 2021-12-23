class Craft
  attr_reader :name,
              :required_supplies

  def initialize(name, required_supplies)
    @name = name
    @required_supplies = required_supplies
  end

  def supply_list
    @required_supplies.map do |item, value|
      item.to_s
    end
  end


end
