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



end