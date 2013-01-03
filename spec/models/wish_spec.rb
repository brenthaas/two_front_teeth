require 'spec_helper'

describe Wish do
  let (:user) { FactoryGirl.create(:user) }
  let (:wish) do 
    user.wishes.build(
      name: "Teeth",
      description: "it's really all I want",
      link: "http://www.fakewebsite.com/thing?blah&blah#fooo",
      price: 10
    )
  end
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :price}
    it {should_not allow_value(-1).for(:price)}
  end

  describe "granting" do
    it "starts off as not granted" do
      wish.granted?.should be false
    end
    it "can be granted" do
      wish.grant!
      wish.granted?.should be true
    end
  end
end