require 'rails_helper'

RSpec.describe Item, type: :model do
  let(:user) { User.create!(name: "john snow", email: "john.snow@gmail.com", password: "winteriscoming") }
  let(:item) { Item.create!(name: "Pick up dry cleaning.", user: user) }
  let(:item_2) { Item.create!(name: "Wash dog", user: user) }
  
  it { should belong_to(:user) }
  it { should validate_presence_of(:name) }
  it { should validate_length_of(:name).is_at_least(1) }
  
  describe "attributes" do
    it "should respond to name" do
      expect(item).to respond_to(:name)
    end
  end
  
  # Before_save tests... controller?
end
