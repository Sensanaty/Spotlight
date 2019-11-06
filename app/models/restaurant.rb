class Restaurant < ApplicationRecord
  CUISINES = ["Italian", "French", "Pizza", "Western", "Turkish", "Greek", "Chinese", "Japanese", "Lebanese", "Indian", "Brazilian", "Thai", "Mexican", "Other"]

  validates :name, :address, :cuisine, :price_level, :photo, presence: :true
  validates :cuisine, inclusion: { in: CUISINES }
  validates :price_level, inclusion: { in: [1, 2, 3] }
  belongs_to :user
  mount_uploader :photo, PhotoUploader
end
