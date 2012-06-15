require 'spec_helper'

describe Friend do

  before do
    @friend = Factory.create(:friend)
  end

  subject { @friend }

  it do should respond_to(:name) end
  it do should respond_to(:email) end




  describe do
    before do
         @friend.credits.create(:miktar => 100 , :durum => "paid")
     end
       it do
         should be_valid
       end
    it do
         @credit=Credit.find(1)
         @credit.friend_id.should eq(@friend.id)
       end

  end





  it do should be_valid end

  describe "when name is not present" do
    before { @friend.name = " "}
    it do should_not be_valid end
  end
  describe "when email format is not valid"  do

    before {@friend.email = "example.com"}
    it do should_not be_valid end
  end

  describe "when email is not present"  do

    before {@friend.email = " "}
    it do should_not be_valid end
  end


end