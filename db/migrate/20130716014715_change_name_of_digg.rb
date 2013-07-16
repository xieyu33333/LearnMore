class ChangeNameOfDigg < ActiveRecord::Migration
  def up
  	rename_column :topics, :digg, :faverates_count
  end

  def down
  	rename_column :topics, :faverates_count, :digg
  end
end
