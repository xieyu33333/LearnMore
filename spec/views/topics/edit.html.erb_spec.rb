require 'spec_helper'

describe "topics/edit" do
  before(:each) do
    @topic = assign(:topic, stub_model(Topic,
      :name => "MyString",
      :content => "MyText",
      :user_id => 1,
      :forum_id => 1,
      :status => 1,
      :digg => 1
    ))
  end

  it "renders the edit topic form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", topic_path(@topic), "post" do
      assert_select "input#topic_name[name=?]", "topic[name]"
      assert_select "textarea#topic_content[name=?]", "topic[content]"
      assert_select "input#topic_user_id[name=?]", "topic[user_id]"
      assert_select "input#topic_forum_id[name=?]", "topic[forum_id]"
      assert_select "input#topic_status[name=?]", "topic[status]"
      assert_select "input#topic_digg[name=?]", "topic[digg]"
    end
  end
end
