require 'spec_helper'

describe FriendsController do
  before(:each) do
    sign_in
  end
  def mock_friend(stubs={})
    @mock_friend ||= mock_model(Friend, stubs).as_null_object
  end


  describe "get index" do

    it "should not show all friends if they dont belongs to current user" do

      Friend.stub(:find).with("1") { mock_friend }

      get :index
      assigns(:friends).should_not eq(mock_friend)
    end

    it "should show all friends of current user " do

      @friend=Factory.create(:friend)
      get :index
      assigns(:friend).should eq(@friend)
    end
  end
end