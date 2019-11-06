class Restaurant < ApplicationRecord
  belongs_to :user
  mount_uploader :photo, PhotoUploader
  #add has_many?
end
