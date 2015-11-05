require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.create!(name: "john snow", email: "john.snow@gmail.com", password: "winteriscoming") }
  
  # References test
  it { should have_many(:items) }
  
  # Email validation
  it { should validate_presence_of(:email) }
  it { should validate_uniqueness_of(:email) }
  it { should validate_length_of(:email).is_at_least(3) }
  it { should allow_value("user@blocitoff.com").for(:email) }
  it { should_not allow_value("user.com").for(:email) }
  
  # Password validation
  it { should validate_presence_of(:password) }
  it { should validate_length_of(:password).is_at_least(6) }
  
  # Name validation
  it { should validate_presence_of(:name) }
  it { should validate_length_of(:name).is_at_least(1) }
  # before_save camel case the name test... controller test?
  
  describe "attributes" do
    it "should respond to email" do
      expect(user).to respond_to(:email)
    end
    
    it "should respond to password" do
      expect(user).to respond_to(:password)
    end
    
    it "should respond to name" do
      expect(user).to respond_to(:name)
    end
  end
end
