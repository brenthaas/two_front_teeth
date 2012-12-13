class UsersController < ApplicationController
	def show
		@user = User.find(params[:id])
	end

	def create
		user = User.create(params[:user])
		redirect_to user_path(user)
	end
end