require 'rspec'


require './lib/craft'
require './lib/event'
require './lib/person'


RSpec.describe Craft do
  it 'exists' do
    craft = Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})

    expect(craft).to be_a Craft
  end

  it 'craft has attributes' do
    craft = Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})

    expect(craft.name).to eq('knitting')
    expect(craft.required_supplies).to eq( {yarn: 20, scissors: 1, knitting_needles: 2})
  end
end
