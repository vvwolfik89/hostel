class Service < ApplicationRecord
  has_one_attached :image
  has_and_belongs_to_many :motels

end
