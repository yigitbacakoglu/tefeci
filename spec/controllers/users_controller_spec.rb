require 'spec_helper'


describe UsersController do
  before(:each) do
    sign_in
  end

  def mock_user(stubs={})
    @mock_user ||= mock_model(User, stubs).as_null_object
  end


  describe "get index" do
    it " should show all users if admin logs in " do
    person= stub_model(User)
    User.stub(:all) { person }
    get :index
    assigns(:users).should eq(person)
    end

    it "should not show all users if user is not admin"  do

        # TO CHANGE CURRENT USER FROM ADMIN TO NORMAL USER
        OmniAuth.config.test_mode = true

        OmniAuth.config.add_mock(:twitter, {  :provider    => "twitter",
                                              :uid         => "1234",  #admin has pre-defined uid
                                              :user_info   => {   :name       => "Bob hope",
                                              },
                                              :credentials => {   :token => "547226058-MaG2cvgXWbrAFNoxv77bLEyPND1Pb1Zu2qnOd1l0"} })

        request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:twitter]
        auth = request.env["omniauth.auth"]
        user = User.find_by_provider_and_uid("twitter", "1234")

        if !user
          deneme=User.new(:provider =>auth['provider'],:uid => auth['uid'])
          deneme.save
          user = User.find_by_provider_and_uid("twitter", "1234")
        end
        session[:user_id] = user.id
  #  ENDS


      person = stub_model(User)
      User.stub(:all) {person}
      get :index
      assigns(:users).should_not eq(person)

    end
  end

  describe "get show user" do

    it "should find user with given id" do
      person= stub_model(User)
      User.stub(:find).with("2") { person }
      #puts person.id
      get :show, :id => "2"
      #assigns(:user).should eq(person)

      #User.stub(:find).with("10") { mock_user }
      #get :show, :id => "10"

      #assigns(:user).should eq(mock_user)

    end
  end

  describe "get new user" do

  end


end