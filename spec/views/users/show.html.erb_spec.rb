require 'rails_helper'

RSpec.describe "users/show", type: :view do
  before(:each) do
    @user = assign(:user, User.create!(
      :user_id => "User",
      :email => "Email",
      :session_token => "Session Token"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/User/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/Session Token/)
  end
end
