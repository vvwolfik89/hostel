class Motel < ApplicationRecord
  geocoded_by :location   # location is the address field
  # after_validation :geocode, if: :will_save_change_to_location?

  validates :latitude, presence: true
  validates :longitude, presence: true

  belongs_to :town
  has_many_attached :images
  has_and_belongs_to_many :services

  def geo_position
    self.latitude & self.longitude ? true : false
  end
end
