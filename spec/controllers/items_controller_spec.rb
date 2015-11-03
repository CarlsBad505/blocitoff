require 'rails_helper'

RSpec.describe ItemsController, type: :controller do
  let(:user) { User.create!(name: "john snow", email: "john.snow@gmail.com", password: "winteriscoming") }
  let(:item) { Item.create!(name: "Pick up dry cleaning.", user: user) }
  
  describe "POST #create" do
    it "returns http redirect" do
      post :create, user_id: user.id, item: {name: "Pick up dry cleaning"}
      expect(response).to redirect_to(user_path)
    end
  end

end
