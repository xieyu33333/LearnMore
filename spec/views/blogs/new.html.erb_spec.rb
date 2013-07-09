require 'spec_helper'

describe "blogs/new" do
  before(:each) do
    assign(:blog, stub_model(Blog,
      :artical => "MyText",
      :user_id => 1,
      :title => "MyString"
    ).as_new_record)
  end

  it "renders new blog form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", blogs_path, "post" do
      assert_select "textarea#blog_artical[name=?]", "blog[artical]"
      assert_select "input#blog_user_id[name=?]", "blog[user_id]"
      assert_select "input#blog_title[name=?]", "blog[title]"
    end
  end
end
