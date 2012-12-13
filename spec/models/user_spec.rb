require 'spec_helper'

describe User do
  let(:user) { User.new(first_name: "John", last_name: "Doe", email: "valid@email.com") }
  subject { user }

  describe "validations" do
    it { should validate_presence_of :first_name }
    it { should validate_presence_of :last_name }
    
    describe "email" do
      it { should validate_presence_of :email }
      it { should validate_uniqueness_of :email }
    end
  end

  describe "factory" do
    it "creates a valid factory" do
      user = FactoryGirl.create(:user)  
      user.should be_valid
    end
  end

  it "combines first and last name into name" do
    user.name.should == user.first_name + " " + user.last_name
  end
end