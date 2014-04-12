class AddFieldsToPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :taken_at, :datetime
    add_column :photos, :iso, :string
    add_column :photos, :aperture, :string
  end
end
