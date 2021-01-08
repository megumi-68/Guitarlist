class Guitar < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  
  validates :content, presence: true, length: { maximum: 255 }
  validates :category, presence: true, length: { maximum: 255 }
  validates :name, presence: true, length: { maximum: 255 }
end
