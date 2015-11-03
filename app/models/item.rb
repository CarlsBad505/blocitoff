class Item < ActiveRecord::Base
  belongs_to :user
  validates :name, length: { minimum: 1 }, presence: true
end
