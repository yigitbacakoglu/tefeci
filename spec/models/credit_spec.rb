require 'spec_helper'

describe Credit do

  before do
    @credit = Factory.create(:credit)
  end

  subject { @credit }

  it do should respond_to(:miktar) end
  it do should respond_to(:durum) end
  it do should respond_to(:friend_id) end
  it do should be_valid end
  it do
    @credit.get_status.should eq("Odendi.")
  end

  it do should belong_to(:friend) end

  describe "when miktar is not present" do
    before { @credit.miktar = " "}
    it do should_not be_valid end
  end
  describe "when durum format is not valid"  do

    before {@credit.durum = "example.com"}
    it do should_not be_valid end
  end

  describe "when durum is not present"  do

    before {@credit.durum = " "}
    it do should_not be_valid end
  end


end