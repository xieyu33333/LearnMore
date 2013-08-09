class ChangeColumnThatStudyfileCanBeBlank < ActiveRecord::Migration
  def up
    change_column :studyfiles, :file_url, :string, :null => true
  end

  def down
    change_column :studyfiles, :file_url, :string, :null => false
  end
end
