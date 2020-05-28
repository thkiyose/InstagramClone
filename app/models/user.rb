class User < ApplicationRecord
  has_many :posts
  validates :name, presence:true, length: { maximum: 30 }, on: :create
  validates :email, presence:true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/ },
                    uniqueness: true, on: :create
  validates :password, presence:true, length: { minimum: 6 },on: :create
  before_validation { email.downcase! }
  has_secure_password
  mount_uploader :image, ImageUploader
end
