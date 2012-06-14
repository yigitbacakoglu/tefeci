require 'spec_helper'


describe CreditsController do


  before(:each) do
    sign_in
  end

  def mock_credit(stubs={})
    @mock_credit ||= mock_model(Credit, stubs).as_null_object
  end

  def mock_friend(stubs={})
    @mock_friend ||= mock_model(Friend, stubs).as_null_object
  end

  def factoryFriend
    @friend = FactoryGirl.create(:friend)
  end
  #----------
  #----------
  describe " get index" do
    it "should get all credits" do

      credit= stub_model(Credit)
      Credit.stub(:all) { credit }
      get :index
      assigns(:credits).should eq(credit)

    end
  end
  #----------
  #----------

  describe "get credit show" do
    it "should find the all credits belongs to given id" do

      #@credit=stub_model(Credit)
      Credit.stub!(:find).with("1") { mock_credit }
      get :show, :id => "1"
      assigns(:credit).should eq(mock_credit)
    end
  end
  #----------
  #----------
  describe "get credit/2/edit edit" do
    it "should edit credit" do
      Credit.stub(:find).with("1") { mock_credit }
      get :edit, :id => "1"
      response.should be_success
      response.should render_template('edit')
    end
  end
  #----------
  #----------
  describe "PUT update" do

    before(:each) do
      factoryFriend
      Credit.stub(:new).with({"these" => "params"}) { mock_credit(:save => true, :friend_id => @friend.id) }
      post :create, :credit => {"these" => "params"}
      Credit.stub(:find).with("1") { mock_credit(:update_attributes => true) }
    end
    it "updates the requested credit" do
      mock_credit.should_receive(:update_attributes).with({"these" => "params"})
      put :update, :id => "1", :credit => {"these" => "params"}
    end
    it "should redirect to the friend path after successful update"do
      put :update, :id => "1", :credit => {"these" => "params"}
      assigns(:credit).should redirect_to(@friend)
    end
    it "should render template" do
      Credit.stub(:find).with("1") { mock_credit(:update_attributes => false) }
      mock_credit.should_receive(:update_attributes).with({'these' => 'params'})
      put :update, :id => "1", :credit => {"these" => "params"}
      assigns(:credit).should render_template(:edit)
    end
  end
  #----------
  #----------
  describe "get credit new" do
    before do
      factoryFriend
    end

    it "should render new form" do
      get :new
      response.should be_success
      response.should render_template('new')
  end
    it "should create a new credit which belongs to session user's friends with given params" do
      Credit.stub(:new).with({"these" => "params"}) { mock_credit(:save => true, :friend_id => @friend.id) }
      post :create, :credit => {"these" => "params"}
      assigns(:credit).should eq(mock_credit)
      #credit = FactoryGirl.create(:credit, :friend_id => @friend.id)
      #get :new , :friend_id => @friend.id
      #puts assigns(:credit).friend_id
    end
  end
  #----------
  #----------
  describe "delete destroy"do
    before(:each) do
      factoryFriend
      Credit.stub(:new).with({"these" => "params"}) { mock_credit(:save => true, :friend_id => @friend.id) }
      post :create, :credit => {"these" => "params"}
    end
    it "should destroy the credit" do
      Credit.stub(:find).with("11") {mock_credit}
      mock_credit.should_recieve(:destroy)
      delete :destroy, :id => "11"
    end
    it "should redirect to the friend's path" do
      Credit.stub(:find) {mock_credit}
      delete :destroy, :id =>"1"
      response.should redirect_to(@friend)
    end

  end
end