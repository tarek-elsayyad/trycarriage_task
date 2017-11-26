class ChangeRealEstateSaleDate < ActiveRecord::Migration[5.0]
  def change
    change_column :real_estates, :sale_date, :string
  end
end
