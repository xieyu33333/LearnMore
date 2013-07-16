class CreateForums < ActiveRecord::Migration
  def change
    create_table :forums do |t|
      t.string :name
      t.string :urlname
      t.text :description
      t.text :rule
      t.integer :parent_id

      t.timestamps
    end
  end
end
