class Town < ApplicationRecord
  belongs_to :country
  has_many :motels
  validates :name, presence: true
end
