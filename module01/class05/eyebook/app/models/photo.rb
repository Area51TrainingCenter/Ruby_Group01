class Photo < ActiveRecord::Base
  belongs_to :user

  has_many :photo_categories
  has_many :categories, through: :photo_categories
  validates :title, presence: true

  def self.search(params)
    results = Photo.all
    # field = :title
    # value = "Probando"
    params.each do |field, value|
      if value.present?
        results = results.where(field => value )
      end
    end    

    results

  end

end