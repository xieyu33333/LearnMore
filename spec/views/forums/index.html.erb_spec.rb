require 'spec_helper'

describe "forums/index" do
  before(:each) do
    assign(:forums, [
      stub_model(Forum,
        :name => "Name",
        :urlname => "Urlname",
        :description => "Description",
        :rule => "Rule",
        :parent_id => 1
      ),
      stub_model(Forum,
        :name => "Name",
        :urlname => "Urlname",
        :description => "Description",
        :rule => "Rule",
        :parent_id => 1
      )
    ])
  end

  it "renders a list of forums" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Urlname".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => "Rule".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
