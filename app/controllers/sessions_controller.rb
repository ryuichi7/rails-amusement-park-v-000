class SessionsController < ApplicationController

	def new
		@users = User.all
	end

	def create
		@user = User.find(params[:user][:id])
		session[:user_id] = @user.id

		redirect_to user_path(@user), notice: "Welcome #{@user.name}"
	end

	def destroy
		reset_session
		redirect_to root_path
	end
end
