class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
         
  validates :email, length: { minimum: 3, maximum: 100 }
  validates :password, length: { minimum: 6 }
  validates :name, length: { minimum: 1 }, presence: true
  has_many :items
end
