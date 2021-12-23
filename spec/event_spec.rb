require 'rspec'
require 'pry'


require './lib/craft'
require './lib/event'
require './lib/person'


RSpec.describe Event do
  it 'exists' do
    craft = Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})
    person = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})
    event = Event.new("Carla's Craft Connection", [craft], [person])
    # binding.pry

    expect(event).to be_a Event
  end

  it 'craft has attributes' do
    craft = Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})
    person = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})
    event = Event.new("Carla's Craft Connection", [craft], [person])


    expect(event.name).to eq("Carla's Craft Connection")
    expect(event.crafts).to eq([craft])
    expect(event.attendees).to eq([person])
  end

  it 'can list names' do
    hector = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})
    toni = Person.new({name: 'Toni', interests: ['sewing', 'knitting']})
    sewing = Craft.new('sewing', {fabric: 5, scissors: 1, thread: 1, sewing_needles: 1})
    knitting = Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})
    event = Event.new("Carla's Craft Connection", [sewing, knitting], [hector, toni])

    expect(event.attendee_names).to eq(["Hector", "Toni"])
  end

  it 'can list craft with most supplies' do
    hector = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})
    toni = Person.new({name: 'Toni', interests: ['sewing', 'knitting']})
    sewing = Craft.new('sewing', {fabric: 5, scissors: 1, thread: 1, sewing_needles: 1})
    knitting = Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})
    event = Event.new("Carla's Craft Connection", [sewing, knitting], [hector, toni])

    expect(event.craft_with_most_supplies).to eq("sewing")
  end

  it 'can list supplies' do
    hector = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})
    toni = Person.new({name: 'Toni', interests: ['sewing', 'knitting']})
    sewing = Craft.new('sewing', {fabric: 5, scissors: 1, thread: 1, sewing_needles: 1})
    knitting = Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})
    event = Event.new("Carla's Craft Connection", [sewing, knitting], [hector, toni])

    expect(event.supply_list).to eq(["fabric", "scissors", "thread", "sewing_needles", "yarn", "knitting_needles"])
  end

  it 'can list person by interest' do
    hector = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})
    toni = Person.new({name: 'Toni', interests: ['sewing', 'knitting']})
    tony = Person.new({name: 'Tony', interests: ['drawing', 'knitting']})
    sewing = Craft.new('sewing', {fabric: 5, scissors: 1, thread: 1, sewing_needles: 1})
    knitting = Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})
    painting = Craft.new('painting', {canvas: 1, paint_brush: 2, paints: 5})
    event = Event.new("Carla's Craft Connection", [knitting, painting, sewing], [hector, toni, tony])

    a = {
       "knitting"=>[toni, tony],
       "painting"=>[],
       "sewing"=>[hector, toni]
    }

    expect(event.attendees_by_craft_interest).to eq(a)
  end

  it 'can list crafts that use' do
    hector = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})
    toni = Person.new({name: 'Toni', interests: ['sewing', 'knitting']})
    tony = Person.new({name: 'Tony', interests: ['drawing', 'knitting']})
    sewing = Craft.new('sewing', {fabric: 5, scissors: 1, thread: 1, sewing_needles: 1})
    knitting = Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})
    painting = Craft.new('painting', {canvas: 1, paint_brush: 2, paints: 5})
    event = Event.new("Carla's Craft Connection", [knitting, painting, sewing], [hector, toni, tony])

    expect(event.crafts_that_use('scissors')).to eq([knitting, sewing])
    expect(event.crafts_that_use('fire')).to eq([])
  end

  it 'can assign attendees' do
    hector = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing', 'painting']})
    toni = Person.new({name: 'Toni', interests: ['sewing', 'knitting']})
    tony = Person.new({name: 'Tony', interests: ['drawing', 'knitting', 'painting']})
    knitting = Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})
    sewing = Craft.new('sewing', {fabric: 5, scissors: 1, thread: 1})
    painting = Craft.new('painting', {canvas: 1, paint_brush: 2, paints: 5})
    toni.add_supply('yarn', 30)
    toni.add_supply('scissors', 2)
    toni.add_supply('knitting_needles', 5)
    toni.add_supply('fabric', 10)
    toni.add_supply('scissors', 1)
    toni.add_supply('thread', 2)
    toni.add_supply('paint_brush', 10)
    toni.add_supply('paints', 20)
    tony.add_supply('yarn', 20)
    tony.add_supply('scissors', 2)
    tony.add_supply('knitting_needles', 2)
    hector.add_supply('fabric', 5)
    hector.add_supply('scissors', 1)
    hector.add_supply('thread', 1)
    hector.add_supply('canvas', 5)
    hector.add_supply('paint_brush', 10)
    hector.add_supply('paints', 20)
    event = Event.new("Carla's Craft Connection", [knitting, painting, sewing], [hector, toni, tony])

    result = {
      knitting => [tony],
      sewing => [hector],
      painting => [hector]
    }

    # allow(event).to receive(:assign_attendees_to_crafts) {result}
    expect(event.assign_attendees_to_crafts).to eq(result)
  end


end
