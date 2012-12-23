require 'spec_helper'

describe Wish do
  let (:wish) do 
    Wish.create!( 
      name: "Teeth",
      description: "it's really all I want",
      link: "http://www.fakewebsite.com/thing?blah&blah#fooo",
      price: 10
    )
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