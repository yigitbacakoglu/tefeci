require 'spec_helper'


describe OdenenController do

  before(:each) do
   sign_in
  end

  def mock_odenen(stubs={})
    @mock_odenen ||= mock_model(Odenen, stubs).as_null_object
  end

  describe "get INDEX " do

    it "should find Friend and his paid credits" do

      @friend=Factory.create(:friend)
      @credit =Factory.create(:credit)


      get :index

      assigns(:odenen).should eq(@friend)


      end
  end
end