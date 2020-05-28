class Post < ApplicationRecord
  belongs_to :user
  validates :content, presence:true, length: { maximum: 200 }
  mount_uploader :image, ImageUploader
end
