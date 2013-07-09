require 'spec_helper'

describe "blogs/index" do
  before(:each) do
    assign(:blogs, [
      stub_model(Blog,
        :artical => "MyText",
        :user_id => 1,
        :title => "Title"
      ),
      stub_model(Blog,
        :artical => "MyText",
        :user_id => 1,
        :title => "Title"
      )
    ])
  end

  it "renders a list of blogs" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Title".to_s, :count => 2
  end
end
