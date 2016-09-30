require 'rails_helper'

RSpec.describe "users/index", type: :view do
  before(:each) do
    assign(:users, [
      User.create!(
        :user_id => "User",
        :email => "Email",
        :session_token => "Session Token"
      ),
      User.create!(
        :user_id => "User",
        :email => "Email",
        :session_token => "Session Token"
      )
    ])
  end

  it "renders a list of users" do
    render
    assert_select "tr>td", :text => "User".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Session Token".to_s, :count => 2
  end
end
