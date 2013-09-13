class AddColumnStatusInBlog < ActiveRecord::Migration
  def up
    add_column :blogs , :status, :integer, :default => 0,  :limit => 1
  end

  def down
    remove_column :blogs , :status
  end
end
