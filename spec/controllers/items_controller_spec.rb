require 'rails_helper'

RSpec.describe ItemsController, type: :controller do
  let(:user) { User.create!(name: "john snow", email: "john.snow@gmail.com", password: "winteriscoming") }
  let(:item) { Item.create!(name: "Pick up dry cleaning.", user: user) }
  
  describe "POST #create" do
    it "increases the number of items by 1" do
      old_count = Item.count
      item = Item.create!(name: "get haircut", user: user)
      expect(Item.count).to eq(old_count + 1)
    end
    
    it "assigns Item.last to @item" do
      post :create, item: {name: "get haircut", user: user}
      expect(assigns(:item)).to eq(Item.last)
    end
    
    it "redirects to user show page" do
      post :create, item: {name: "get haircut", user: user}
      expect(response).to redirect_to(user_path)
    end
  end

end
