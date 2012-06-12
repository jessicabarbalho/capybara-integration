require 'spec_helper'

describe "SignUps" do
  it "any person can sign up on the app" do
    visit home_index_path
    click_link "Sign up"
    fill_in "Email", :with => "jessicar@redu.com.br"
    fill_in "Password", :with => "123456"
    click_on 'Create User'
    current_path.should eq(home_index_path)
    page.should have_content("Signed up!")
  end

  it "A user must have a valid email and password" do
    visit home_index_path
    click_link "Sign up"
    fill_in "Email", :with => "jesica"
    fill_in "Password", :with => "123"
    click_on 'Create User'
    current_path.should eq(users_path)
    page.should have_content("Password is too short")
    page.should have_content("Email is invalid")
  end
end
