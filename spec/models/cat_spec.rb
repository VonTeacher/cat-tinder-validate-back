require 'rails_helper'

RSpec.describe Cat, type: :model do
  it "should have a name" do
    cat = Cat.create age: 2, enjoys: 'alllll the attention'
    expect(cat.errors[:name]).to_not be_empty
  end
  it "should have an age" do
    cat = Cat.create name: 'Toasty', enjoys: 'alllll the attention'
    expect(cat.errors[:age]).to_not be_empty
  end
  it "should have an enjoys" do
    cat = Cat.create name: 'Toasty', age: 2
    expect(cat.errors[:enjoys]).to_not be_empty
  end
  it "should have an enjoys" do
    cat = Cat.create name: 'Toasty', age: 2, enjoys: 'attention'
    expect(cat.errors[:enjoys]).to_not be_empty
  end
end
