class Shop < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :owner
  has_many :calendars
  has_many :chats, foreign_key: :shop_id, dependent: :destroy
  has_many :availables, foreign_key: :shop_id, dependent: :destroy
  has_many :tag_to_shops, foreign_key: :shop_id, dependent: :destroy
  has_many :tag, through: :tag_to_shops
  validates :name, presence: true, length: { maximum: 50 }
  validates :zip_code, presence: true
  validates :prefecture, presence: true
  validates :city, presence: true
  validates :tel, presence: true
  validates :station, presence: true

  # scope :search, -> (search_params) do
  #   return if search_params.blank?
  #   prefecture(search_params[:prefecture])
  #     .tag(search_params[:tag])
  # end
  # scope :prefecture, -> (prefecture) { where('prefecture LIKE ?', "%#{prefecture}%") if prefecture.present?}
  # scope :tag, -> (tag) { where(tag_id: tag) if tag.present?}
  
end
