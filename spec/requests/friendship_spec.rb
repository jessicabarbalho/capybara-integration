require 'spec_helper'

describe "Friendship request" do
  it "An user can do a friendship request" do
    User.create(:email => "jessica@redu.com.br", :password => 123456)
    User.create(:email => "testuser@redu.com.br", :password => 123456)
    visit home_index_path
    click_link "Log in"
    fill_in 'Email', :with => 'jessica@redu.com.br'
    fill_in 'Password', :with => 123456
    click_button 'Log in'
    click_link 'show'
    current_path.should eq(user_show(1))
    click_link 'add friend'
    page.should have_content('waiting answerfor request')
  end
end
