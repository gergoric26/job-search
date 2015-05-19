class CreatePosaos < ActiveRecord::Migration
  def change
    create_table :posaos do |t|
      t.string :title
      t.text :description
      t.string :company
      t.string :url

      t.timestamps
    end
  end
end
