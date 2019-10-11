class Post < ApplicationRecord
  belongs_to :user
  has_many :task
  accepts_nested_attributes_for :task
end
