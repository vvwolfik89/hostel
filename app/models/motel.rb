class Motel < ApplicationRecord
  belongs_to :town
  has_many_attached :images
end
