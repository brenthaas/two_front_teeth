require 'spec_helper'

describe "User actions" do
	let!(:user) { FactoryGirl.create(:user) }

	describe "CRUD" do
		it "shows user information" do
			visit user_path(user)
			page.should have_content(user.name)
		end
	end
end