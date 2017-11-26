class AddBathsNumberToEstateSaleDate < ActiveRecord::Migration[5.0]
  def change
    add_column :real_estates, :baths_number, :integer
  end
end
