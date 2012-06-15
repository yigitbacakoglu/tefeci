require 'spec_helper'


describe TweetsController do

  before(:each) do
    sign_in
  end

  def mock_tweets(stubs={})
    @mock_tweets ||= mock_model(Tweets, stubs).as_null_object
  end

  describe "get INDEX " do

    it "should find Friend and his paid credits" do


      post :create
      response.should be_valid
      response.should redirect_to(friends_path)


    end
  end
end