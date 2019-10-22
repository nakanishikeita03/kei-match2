class Post < ApplicationRecord
  belongs_to :user
  has_many :tasks
  accepts_nested_attributes_for :tasks
  has_many :likes, dependent: :destroy
  has_many :liking_users, through: :likes, source: :user
end
