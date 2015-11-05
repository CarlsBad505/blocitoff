require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:user) { User.create!(name: "john snow", email: "john.snow@gmail.com", password: "winteriscoming") }

context do
  before do
    sign_in(user) # find the right method to sign_in with devise
  end
  
  describe "GET #show" do
    it "returns http success" do
      get :show, { id: user.id }
      expect(response).to have_http_status(:success)
    end
  
    it "renders the show view" do
      get :show, { id: user.id }
      expect(response).to render_template(:show)
    end
  end
end

end
