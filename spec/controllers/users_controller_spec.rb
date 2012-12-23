require 'spec_helper'

describe UsersController do
  describe "GET #index" do
    let!(:users) { FactoryGirl.create_list(:user, 5) }
    it "assigns @users to a list of users" do
      get :index
      assigns(:users).should == users
    end
  end

  describe "GET #show" do
    let(:user) { FactoryGirl.create(:user) }
    it "assigns @user for display" do
      get :show, {:id => user.to_param}
      assigns(:user).should == user
    end
  end

  describe "GET #new" do
    it "assigns a new user to @user" do
      get :new
      assigns(:user).should be_a_new User
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