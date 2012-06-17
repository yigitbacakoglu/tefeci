require 'spec_helper'

describe User do

  before do
       @user = User.new(:uid=>"123", :provider => "twitter", :name=>"yigit")
  end

  subject { @user }

  it do should respond_to(:uid) end
  it do should respond_to(:provider) end
  it do should respond_to(:name) end
  it do should be_valid end
  it do should have_many(:friends) end
  it do should have_many(:credits) end

  let(:auth)  { {"provider" => "twitter", "uid" => 12345} }
  let(:auths) { mock "auths" }
  describe do
    it do
      User.create_with_omniauth(auth)
      it do should be_valid end
    end
  end


end