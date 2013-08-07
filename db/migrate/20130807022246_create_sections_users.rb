class CreateSectionsUsers < ActiveRecord::Migration
  def change
    create_table :sections_users do |t|
      t.integer :section_id
      t.integer :user_id
      t.timestamps
    end
  end
end
