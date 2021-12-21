
class Event
  attr_reader :name,
              :crafts,
              :attendees

  def initialize(name, crafts, attendees)
    @name = name
    @crafts = crafts
    @attendees = attendees
  end

  def attendee_names
    @attendees.map do |attendee|
      attendee.name
    end
  end

  def craft_with_most_supplies
    craft_list = {}
    @crafts.map do |craft|
        craft_list[craft.name] = craft.required_supplies.count
    end
    most_craft = craft_list.max_by do |key,v|
      v
    end
    most_craft[0]
    # require'pry';binding.pry
  end

end
