require 'spec_helper'

describe "forums/show" do
  before(:each) do
    @forum = assign(:forum, stub_model(Forum,
      :name => "Name",
      :urlname => "Urlname",
      :description => "Description",
      :rule => "Rule",
      :parent_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Urlname/)
    rendered.should match(/Description/)
    rendered.should match(/Rule/)
    rendered.should match(/1/)
  end
end
