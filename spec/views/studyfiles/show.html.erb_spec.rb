require 'spec_helper'

describe "studyfiles/show" do
  before(:each) do
    @studyfile = assign(:studyfile, stub_model(Studyfile,
      :filename => "Filename",
      :filetype => 1,
      :download_count => 2,
      :faverate_count => 3,
      :file_url => "File Url",
      :user_id => 4,
      :price => "9.99"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Filename/)
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/3/)
    rendered.should match(/File Url/)
    rendered.should match(/4/)
    rendered.should match(/9.99/)
  end
end
