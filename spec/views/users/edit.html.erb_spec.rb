require 'rails_helper'

RSpec.describe "users/edit", type: :view do
  before(:each) do
    @user = assign(:user, User.create!(
      :user_id => "MyString",
      :email => "MyString",
      :session_token => "MyString"
    ))
  end

  it "renders the edit user form" do
    render

    assert_select "form[action=?][method=?]", user_path(@user), "post" do

      assert_select "input#user_user_id[name=?]", "user[user_id]"

      assert_select "input#user_email[name=?]", "user[email]"

      assert_select "input#user_session_token[name=?]", "user[session_token]"
    end
  end
end
