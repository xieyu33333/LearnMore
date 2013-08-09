class AddOutsiteInStudyfile < ActiveRecord::Migration
  def up
    add_column :studyfiles, :description, :text
    add_column :studyfiles, :outsite, :string
  end

  def down
    remove_column :studyfiles, :description
    remove_column :studyfiles, :outsite
  end
end
