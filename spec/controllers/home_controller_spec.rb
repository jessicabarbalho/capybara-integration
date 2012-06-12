require 'spec_helper'

describe HomeController do

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
  end

  describe "GET 'secret'" do
    it "returns http success" do
      get 'secret'
      response.should be_success
    end
  end

end
