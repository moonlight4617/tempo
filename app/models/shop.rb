class Shop < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :owner
  has_many :calendars
end
