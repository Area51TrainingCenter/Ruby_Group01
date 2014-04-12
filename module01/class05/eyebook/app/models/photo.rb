class Photo < ActiveRecord::Base
  belongs_to :user

  has_many :photo_categories
  has_many :categories, through: :photo_categories
  validates :title, presence: true

  # params = {}
  # params[:title] = "XXX"
  # Photo.search(params)
  def self.search(params)
    results = Photo.all
    # field = :title
    # value = "Probando"

    # params[:gatito] = 10

    column_names = Photo.column_names

    params.each do |field, value|
      if value.present? && column_names.include? field.to_s
        begin
          results = results.where(field => value )
        rescue
          puts "ERROR"!
        end
      end
    end    

    results

  end

end