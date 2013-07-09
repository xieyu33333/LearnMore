require 'spec_helper'

describe "studyfiles/index" do
  before(:each) do
    assign(:studyfiles, [
      stub_model(Studyfile,
        :filename => "Filename",
        :filetype => 1,
        :download_count => 2,
        :faverate_count => 3,
        :file_url => "File Url",
        :user_id => 4,
        :price => "9.99"
      ),
      stub_model(Studyfile,
        :filename => "Filename",
        :filetype => 1,
        :download_count => 2,
        :faverate_count => 3,
        :file_url => "File Url",
        :user_id => 4,
        :price => "9.99"
      )
    ])
  end

  it "renders a list of studyfiles" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Filename".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => "File Url".to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
  end
end
