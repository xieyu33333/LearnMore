class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
      t.string  :name,           :null => false
      t.integer :studyfile_id
      t.integer :blog_id
      t.integer :user_id
      t.timestamps
    end
  end
end
