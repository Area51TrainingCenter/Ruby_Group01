class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.integer :age
      t.string :gender
      t.text :bio
      t.string :username
      t.datetime :born_at
      t.string :address
      t.string :telephone
      t.decimal :credits, precision: 8, scale: 2
      t.timestamps
    end

  end
end
