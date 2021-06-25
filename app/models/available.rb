class Available < ApplicationRecord
  belongs_to :shop
  validates :start_time, uniqueness: { scope: [:shop_id, :rent_date] }
end
