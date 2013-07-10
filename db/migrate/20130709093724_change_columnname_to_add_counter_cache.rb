class ChangeColumnnameToAddCounterCache < ActiveRecord::Migration
  def up
  	rename_column :studyfiles, :download_count, :downloads_count
  	rename_column :studyfiles, :faverate_count, :faverates_count
  	add_column :blogs, :faverates_count, :integer
  end

  def down
  	rename_column :studyfiles, :downloads_count, :download_count
  	rename_column :studyfiles, :faverates_count, :faverate_count
  	remove_column :blogs, :faverates_count
  end
end
