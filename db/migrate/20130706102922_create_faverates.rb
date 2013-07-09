class CreateFaverates < ActiveRecord::Migration
  def change
    create_table :faverates do |t|
      t.integer :user_id
      t.integer :studyfile_id
      t.integer :blog_id

      t.timestamps
    end
  end
end
