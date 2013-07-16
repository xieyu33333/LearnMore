require 'spec_helper'

describe "forums/new" do
  before(:each) do
    assign(:forum, stub_model(Forum,
      :name => "MyString",
      :urlname => "MyString",
      :description => "MyString",
      :rule => "MyString",
      :parent_id => 1
    ).as_new_record)
  end

  it "renders new forum form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", forums_path, "post" do
      assert_select "input#forum_name[name=?]", "forum[name]"
      assert_select "input#forum_urlname[name=?]", "forum[urlname]"
      assert_select "input#forum_description[name=?]", "forum[description]"
      assert_select "input#forum_rule[name=?]", "forum[rule]"
      assert_select "input#forum_parent_id[name=?]", "forum[parent_id]"
    end
  end
end
