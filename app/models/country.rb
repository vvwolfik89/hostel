class Country < ApplicationRecord
  has_many :towns, dependent: :destroy

  validates :title, presence: true
  # has_and_belongs_to_many :users
end
