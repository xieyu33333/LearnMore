class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.string :name
      t.text :content
      t.integer :user_id
      t.integer :forum_id,  :null => false, :default => 0, :limit => 2
      t.integer :status, :null => false, :default => 0, :limit => 1
      t.integer :digg

      t.timestamps
    end
  end
end
