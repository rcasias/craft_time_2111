require 'rspec'


require './lib/craft'
require './lib/event'
require './lib/person'


RSpec.describe Person do
  it 'exists' do
    person = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})

    expect(person).to be_a Person
  end

  it 'person has attributes' do
    person = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})

    expect(person.name).to eq('Hector')
    expect(person.interests).to eq(['sewing', 'millinery', 'drawing'])
    expect(person.supplies).to eq({})
  end
end
