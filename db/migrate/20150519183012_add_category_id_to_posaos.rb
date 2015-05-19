class AddCategoryIdToPosaos < ActiveRecord::Migration
  def change
    add_column :posaos, :category_id, :integer
  end
end
