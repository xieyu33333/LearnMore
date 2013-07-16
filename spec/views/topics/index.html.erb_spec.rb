require 'spec_helper'

describe "topics/index" do
  before(:each) do
    assign(:topics, [
      stub_model(Topic,
        :name => "Name",
        :content => "MyText",
        :user_id => 1,
        :forum_id => 2,
        :status => 3,
        :digg => 4
      ),
      stub_model(Topic,
        :name => "Name",
        :content => "MyText",
        :user_id => 1,
        :forum_id => 2,
        :status => 3,
        :digg => 4
      )
    ])
  end

  it "renders a list of topics" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
  end
end
