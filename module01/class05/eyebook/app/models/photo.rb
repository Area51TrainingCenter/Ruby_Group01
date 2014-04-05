class Photo < ActiveRecord::Base
  belongs_to :user
  has_many :photo_categories
  has_many :categories, through: :photo_categories
end