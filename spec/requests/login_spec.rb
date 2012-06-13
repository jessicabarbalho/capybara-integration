require 'spec_helper'

describe "Login" do
  it "A person can log with a valid email and password" do
    User.create(:email => "jessica@redu.com.br", :password => 123456)
    visit home_index_path
    click_link "Log in"
    fill_in 'Email', :with => 'jessica@redu.com.br'
    fill_in 'Password', :with => 123456
    click_button 'Log in'
    current_path.should eq(users_path)
    page.should have_content("Logged in as jessica@redu.com.br")
  end

  it "A person can't log with invalid email or password" do
    visit home_index_path
    click_link "Log in"
    fill_in 'Email', :with => 'jessica@redu.com.br'
    fill_in 'Password', :with => 123456
    click_button 'Log in'
    current_path.should eq(login_path)
    page.should have_content("Email or password invalid!")
  end
end

describe "Logout" do
  it "A person can logout" do
    User.create(:email => "jessica@redu.com.br", :password => 123456)
    visit home_index_path
    click_link "Log in"
    fill_in 'Email', :with => 'jessica@redu.com.br'
    fill_in 'Password', :with => 123456
    click_button 'Log in'
    click_link 'Log out'
    current_path.should eq(home_index_path)
    page.should have_content("Logged out!")
  end
end
