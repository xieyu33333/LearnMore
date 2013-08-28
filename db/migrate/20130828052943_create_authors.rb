class CreateAuthors < ActiveRecord::Migration
  def change
    create_table :authors do |t|
      t.integer :section_id
      t.integer :user_id
      t.text    :content

      t.timestamps
    end
  end
end
