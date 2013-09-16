class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string  :content
      t.integer :user_id
      t.string  :link 
      t.timestamps
    end
  end
end
