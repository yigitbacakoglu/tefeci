require 'spec_helper'


describe OdenmeyenController do

  before(:each) do
   sign_in
  end

  def mock_odenmeyen(stubs={})
    @mock_odenmeyen ||= mock_model(Odenmeyen, stubs).as_null_object
  end

  describe "get INDEX " do

    it "should find Friend and his paid credits" do

      @friend=Factory.create(:friend)
      @credit =Factory.create(:credit)


      get :index

      assigns(:odenmeyen).should eq(@friend)


      end
  end
end