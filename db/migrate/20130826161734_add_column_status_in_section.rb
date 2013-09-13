class AddColumnStatusInSection < ActiveRecord::Migration
  def up
    add_column :sections, :status, :integer, :default => 0,  :limit => 1
    add_column :sections, :pid, :integer
  end

  def down
    remove_column :sections , :status
    remove_column :sections, :pid
  end
end
