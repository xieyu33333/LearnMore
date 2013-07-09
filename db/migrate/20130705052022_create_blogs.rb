class CreateBlogs < ActiveRecord::Migration
  def change
    create_table :blogs do |t|
      t.text :artical
      t.integer :user_id
      t.string :title

      t.timestamps
    end
  end
end
