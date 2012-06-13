require 'spec_helper'


describe CreditsController do
  before(:each) do
    sign_in
  end
=begin
  describe "PUT update" do

  describe "without login with valid params" do

    before(:each) do
      sign_in
      @credit=mock_model(Credit,:update_attributes => true)

    Credit.stub!(:find).with("1").and_return(@credit)
    end

      it "should not find credit with id 1 without login "do
      Credit.should_receive(:find).with("1").and_return(@credit)
        put :update, :id => "1", :Credit => {}
    end

  end



  describe "without login with invalid parameters"
  describe "with login with valid parameters"
  describe "with login with invalid parameters"

  end
=end

  def mock_credit(stubs={})
    @mock_credit ||= mock_model(Credit, stubs).as_null_object
  end

  describe " get index" do
    it "should all credits" do
      Credit.stub(:all) { mock_credit }
      get :index
      assigns(:credits).should eq(mock_credit)
    end
  end
end