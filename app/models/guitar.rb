class Guitar < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  
  validates :content, presence: true, length: { maximum: 255 }
  validates :category, presence: true, length: { maximum: 255 }
  validates :name, presence: true, length: { maximum: 255 }
end
