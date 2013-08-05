class AddColumnSectionDescription < ActiveRecord::Migration
  def up
    add_column :sections, :description, :text
    change_column :studyfiles, :filetype, :string
  end

  def down
    remove_column :sections, :description, :text
    change_column :studyfiles, :filetype, :integer
  end
end
