require 'spec_helper'

describe UserController do

  describe "GET 'name'" do
    it "returns http success" do
      get 'name'
      response.should be_success
    end
  end

  describe "GET 'email'" do
    it "returns http success" do
      get 'email'
      response.should be_success
    end
  end

  describe "GET 'hometown'" do
    it "returns http success" do
      get 'hometown'
      response.should be_success
    end
  end

end
