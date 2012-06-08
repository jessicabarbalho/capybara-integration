require 'spec_helper'

describe "SignUps" do
  it "any person can sign up on the app" do
    visit users_path
    click_link "Sign up"
    fill_in "Email", :with => "jessica@redu.com.br"
    fill_in "Password", :with => "123456"
    click_on 'Create User'
    current_path.should eq(users_path)
    page.should have_content("User was successfully created.")
  end
end
