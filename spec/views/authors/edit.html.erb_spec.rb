require 'spec_helper'

describe "authors/edit" do
  before(:each) do
    @author = assign(:author, stub_model(Author,
      :section_id => 1,
      :user_id => 1
    ))
  end

  it "renders the edit author form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", author_path(@author), "post" do
      assert_select "input#author_section_id[name=?]", "author[section_id]"
      assert_select "input#author_user_id[name=?]", "author[user_id]"
    end
  end
end
