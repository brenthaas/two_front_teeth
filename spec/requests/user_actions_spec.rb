require 'spec_helper'

describe "User actions" do
  let(:user) { FactoryGirl.create(:user) }

  describe "view details" do
    before { visit user_path(user) }
    it "displays the user name" do
      page.should have_content(user.name)
    end
    it "displays the user email" do
      page.should have_content(user.email)
    end
  end

  describe "new user" do
    before { visit new_user_path }
    it "adds a new user" do
      expect {
        fill_in 'First Name', with: "John"
        fill_in 'Last Name', with: "Doe"
        fill_in 'Email', with: "johndoe@test.com"
        click_button 'Create'
      }.to change(User, :count).by(1)
    end
  end
end