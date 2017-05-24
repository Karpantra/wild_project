class Product < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_attachments :photos, maximum: 2
  geocoded_by :address
  after_validation :geocode, if: :address_changed?
end
