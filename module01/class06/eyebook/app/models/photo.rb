class Photo < ActiveRecord::Base
  belongs_to :user

  has_many :photo_categories
  has_many :categories, through: :photo_categories
  validates :title, presence: true, on: :update

  #after_create :warn_copyright
  #after_update :warn_copyright

  CopyrightDatabase = Class.new

  def warn_copyright
    CopyrightDatabase.verify(self)
    save
  end

  def create_permalink
    self.permalink ||= self.title.parameterize
  end

 def self.search(params)
    results = Photo.all
    # field = :title
    # value = "Probando"

    # params[:gatito] = 10

    column_names = Photo.column_names

    params.each do |field, value|
      if value.present? && column_names.include?(field.to_s)
        results = results.where(field => value )
      end
    end    

    results

  end

end