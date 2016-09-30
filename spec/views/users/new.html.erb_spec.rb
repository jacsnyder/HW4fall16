require 'rails_helper'

RSpec.describe "users/new", type: :view do
  before(:each) do
    assign(:user, User.new(
      :user_id => "MyString",
      :email => "MyString",
      :session_token => "MyString"
    ))
  end

  it "renders new user form" do
    render

    assert_select "form[action=?][method=?]", users_path, "post" do

      assert_select "input#user_user_id[name=?]", "user[user_id]"

      assert_select "input#user_email[name=?]", "user[email]"

      assert_select "input#user_session_token[name=?]", "user[session_token]"
    end
  end
end
