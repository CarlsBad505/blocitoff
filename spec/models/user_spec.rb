require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.create!(email: "john.snow@gmail.com", password: "winteriscoming") }
  
  # Email validation
  it { should validate_presence_of(:email) }
  it { should validate_uniqueness_of(:email) }
  it { should validate_length_of(:email).is_at_least(3) }
  it { should allow_value("user@blocitoff.com").for(:email) }
  it { should_not allow_value("user.com").for(:email) }
  
  # Password validation
  it { should validate_presence_of(:password) }
  it { should have_secure_password }
  #it { should validate_length_of(:password).is_at_least(6) }
  
  describe "attributes" do
    it "should respond to email" do
      expect(user).to respond_to(:email)
    end
    
    it "should respond to password" do
      expect(user).to respond_to(:password)
    end
  end
end
