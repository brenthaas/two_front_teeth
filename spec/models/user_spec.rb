require 'spec_helper'

describe User do
	describe "factory" do
		it "creates a valid factory" do
			user = FactoryGirl.create(:user)	
			user.should be_valid
		end
	end

	let!(:user) { User.new(first_name: "John", last_name: "Doe", email: "valid@email.com") }
	subject { user }

	it_validates "presence of", :user, :first_name
	it_validates "presence of", :user, :last_name

	specify "name is first and last name" do
		user.name.should == user.first_name + " " + user.last_name
	end
end