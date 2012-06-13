require 'spec_helper'


describe SessionsController do


  before(:each) do

    sign_in
  end
  describe "success" do

    it "should create  authentication" do

        post :create, :provider => "twitter"
        response.should redirect_to(root_url)
      end


  end





end