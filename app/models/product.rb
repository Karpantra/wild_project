class Product < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_attachments :photos, maximum: 3
  geocoded_by :address
  after_validation :geocode, if: :address_changed?
  validates :title, presence: true
  validates :city, presence: true
  validates :price, presence: true
  validates :address, presence: true
end
