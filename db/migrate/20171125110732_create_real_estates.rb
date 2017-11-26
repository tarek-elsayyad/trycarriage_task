class CreateRealEstates < ActiveRecord::Migration[5.0]
  def change
    create_table :real_estates do |t|
      t.string :street
      t.string :city
      t.string :zip
      t.string :state
      t.integer :beds_number
      t.integer :baths_number
      t.integer :square_feet
      t.integer :building_type
      t.string :sale_date
      t.decimal :price
      t.float :latitude
      t.float :longitude 
      t.timestamps
    end
  end
end
