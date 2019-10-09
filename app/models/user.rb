class User < ApplicationRecord

  has_many :group_users
  has_many :groups, through: :group_users
  has_many :messages

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  mount_uploader :img_name, ImageUploader
  enum sex: { 男: 0, 女: 1 }
  enum hobby: { 読書: 0, 映画: 1, 旅行: 2, アウトドア: 3, お酒: 4 }
  validates :img_name, presence: true
end
