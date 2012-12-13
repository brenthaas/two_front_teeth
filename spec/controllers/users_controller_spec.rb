require 'spec_helper'

describe UsersController do
	describe "GET users#show" do
		let!(:user) { FactoryGirl.create(:user) }
		it "assigns @user for display" do
			get :show, {:id => user.to_param}
			assigns(:user).should == user
		end
	end

	describe "POST create" do
		let(:valid_attributes) do 
			{first_name: "First", last_name: "Last", email: "testemail@email.com"} 
		end	
		it "creates a new user in the database" do
			expect{
				post :create, {:user => valid_attributes}
			}.to change(User, :count).by(1)
		end
		it "redirects to show page" do
				post :create, {:user => valid_attributes}
				response.should redirect_to User.last
		end
	end
end