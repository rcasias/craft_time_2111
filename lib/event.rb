
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
  end

  def supply_list
    @crafts.map do |craft|
      craft.required_supplies.map do |k,v|
        k.to_s
      end
    end.flatten.uniq
  end

  def attendees_by_craft_interest
    r = @crafts.each_with_object({}) do |k,v|
      v[k.name] = []
    end

    @attendees.each do |attendee|
      @crafts.each do |craft|
        if attendee.interests.include?(craft.name)
          r[craft.name] << attendee
        else
          r[craft.name] == attendee
        end
      end
    end
    r
  end

  def crafts_that_use(material)
    results = []

    @crafts.each do |craft|
      if craft.supply_list.include?(material)
        results << craft
      end
    end
    results
  end

  def assign_attendees_to_crafts
    hash = @crafts.each_with_object({}) do |k, hash|
      hash[k] = []
    end

    @crafts.each do |k,v|
      @attendees.shuffle.each do |attendee|
        if attendee.interests.include?(k.name) && attendee.can_build?(k)
          hash[k] << attendee
        end
      end
    end

    random_result = hash.map do |k,v|
      hash[k] = v.sample(rand(v.count + 1))
    end
    # require'pry';binding.pry
    hash
  end



end
