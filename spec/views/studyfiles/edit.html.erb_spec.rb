require 'spec_helper'

describe "studyfiles/edit" do
  before(:each) do
    @studyfile = assign(:studyfile, stub_model(Studyfile,
      :filename => "MyString",
      :filetype => 1,
      :download_count => 1,
      :faverate_count => 1,
      :file_url => "MyString",
      :user_id => 1,
      :price => "9.99"
    ))
  end

  it "renders the edit studyfile form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", studyfile_path(@studyfile), "post" do
      assert_select "input#studyfile_filename[name=?]", "studyfile[filename]"
      assert_select "input#studyfile_filetype[name=?]", "studyfile[filetype]"
      assert_select "input#studyfile_download_count[name=?]", "studyfile[download_count]"
      assert_select "input#studyfile_faverate_count[name=?]", "studyfile[faverate_count]"
      assert_select "input#studyfile_file_url[name=?]", "studyfile[file_url]"
      assert_select "input#studyfile_user_id[name=?]", "studyfile[user_id]"
      assert_select "input#studyfile_price[name=?]", "studyfile[price]"
    end
  end
end
