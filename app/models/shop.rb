class Shop < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :owner
  has_many :calendars
  has_many :chats, foreign_key: :shop_id, dependent: :destroy
end
