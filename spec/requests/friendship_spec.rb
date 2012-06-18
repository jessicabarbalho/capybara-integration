require 'spec_helper'

describe "Friendship request" do
  before do
    @jessica = User.create(:email => "jessica@redu.com.br",
                          :password => 123456)
    @test = User.create(:email => "testuser@redu.com.br",
                       :password => 123456)
    visit home_index_path
    click_link "Log in"
    fill_in 'Email', :with => 'jessica@redu.com.br'
    fill_in 'Password', :with => 123456
    click_button 'Log in'
  end

  it "An user can do a friendship request" do
    click_link 'Add friend'
    page.should have_content('The request was sent!')
  end

  describe "Resquests through AJAX" do
    before do
      @test.be_friends_with(@jessica)
      click_link 'Log out'
      visit home_index_path
      click_link "Log in"
      fill_in 'Email', :with => 'jessica@redu.com.br'
      fill_in 'Password', :with => 123456
      click_button 'Log in'
    end

    it "An user can acceptd a friend request", :js => true do
      click_link 'Accept'
      page.has_no_xpath?('span')
      page.should have_content("You and testuser@redu.com.br are now friends")
    end

    it "An user can deny a friendship request", :js => true do
      click_link 'Deny'
      page.has_no_xpath?('span')
      page.should have_content("You deny the friendship from testuser@redu.com.br")
    end
  end
end
