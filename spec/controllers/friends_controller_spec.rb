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
      assigns(:friends).should eq([@friend])
    end
  end

  describe "get friends show" do
    it "should find the all credits belongs to given friend id and should find the friends of current user" do
      @credit = Factory.create(:credit)
      @friend = Factory.create(:friend)
      get :show, :id => "1"
      assigns(:friend).should eq( @friend )
    end
  end

  describe "get NEW friend" do
    it "should render new form" do
      get :new
      response.should be_success
      response.should render_template("new")
    end
    it "should CREATE a new friend" do
      Friend.stub(:new).with("asd"=>"sd") {mock_friend}
      post :create, :friend=> {"asd" => "sd"}
      assigns(:friend).should be(mock_friend)
    end
    it "should render new form if unsuccessful save " do
      Friend.stub(:new).with("these"=>"params") {mock_friend(:save => false)}
      post :create , :friend => {"these" => "params"}
      response.should be_success
      response.should render_template("new")
    end
  end

  describe "get friends EDIT" do
    it "should response success and render template"do
      @friend = Factory(:friend)
      get :edit , :id => "1"
      response.should be_success
      response.should render_template("edit")
    end
  end

  describe "put UPDATE friend"do
    before(:each) do
      Friend.stub(:find).with("1") {mock_friend}
    end
    it "should recieve update attributes" do
      mock_friend.should_recieve(:update_attributes).with("these"=>"params")
      put :update, :id => "1", :friend =>{"these" => "params"}
    end
    it "should redirect to friends path"do
      put :update, :id => "1", :friend => {"these" => "params"}
      assigns(:friend).should redirect_to(mock_friend)
    end
    it "should render template if error occurs" do
      Friend.stub(:find).with("1") { mock_friend(:update_attributes => false) }
      mock_friend.should_receive(:update_attributes).with({'these' => 'params'})
      put :update, :id => "1", :friend => {"these" => "params"}
      assigns(:friend).should render_template(:edit)
    end
  end

  describe "delete DESTROY" do
    it "should delete friend " do
      Friend.stub(:find).with("11") {mock_friend}
      mock_friend.should_recieve(:destroy)
      delete :destroy, :id => "11"
    end
    it "should redirect to friends url"do
      Friend.stub(:find) {mock_friend}
      delete :destroy, :id =>"1"
      response.should redirect_to(friends_url)
    end
  end

  describe "prepare EMAIL" do
    it "should get email"do
      Friend.stub(:find).with("1") {mock_friend}
      get :email , :id => "1"
      response.should redirect_to(mock_friend)
    end
  end

end