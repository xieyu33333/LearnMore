require 'spec_helper'

describe "authors/new" do
  before(:each) do
    assign(:author, stub_model(Author,
      :section_id => 1,
      :user_id => 1
    ).as_new_record)
  end

  it "renders new author form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", authors_path, "post" do
      assert_select "input#author_section_id[name=?]", "author[section_id]"
      assert_select "input#author_user_id[name=?]", "author[user_id]"
    end
  end
end
