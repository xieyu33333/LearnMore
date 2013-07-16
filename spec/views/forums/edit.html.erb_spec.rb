require 'spec_helper'

describe "forums/edit" do
  before(:each) do
    @forum = assign(:forum, stub_model(Forum,
      :name => "MyString",
      :urlname => "MyString",
      :description => "MyString",
      :rule => "MyString",
      :parent_id => 1
    ))
  end

  it "renders the edit forum form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", forum_path(@forum), "post" do
      assert_select "input#forum_name[name=?]", "forum[name]"
      assert_select "input#forum_urlname[name=?]", "forum[urlname]"
      assert_select "input#forum_description[name=?]", "forum[description]"
      assert_select "input#forum_rule[name=?]", "forum[rule]"
      assert_select "input#forum_parent_id[name=?]", "forum[parent_id]"
    end
  end
end
