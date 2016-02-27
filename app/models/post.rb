class Post < ActiveRecord::Base
  mount_uploader :cover_photo, CoverPhotoUploader
  validates_presence_of :title
  validates_presence_of :content
end
