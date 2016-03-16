class UsersController < ApplicationController
	before_action :set_user, only: [:edit, :update, :show, :destroy]
	before_action :authenticate_user!, except: [:new, :create]

	def new
		if logged_in?
			redirect_to root_path, alert: "You are already signed in. Logout to create a new user"
		else
			@user = User.new
		end
	end

	def create
		@user = User.create(user_params)
		session[:user_id] = @user.id
		redirect_to @user, notice: "Welcome #{@user.name}"
	end

	def show
	end

	def update
		@user.update(user_params)
		redirect_to @user, alert: "#{@user.name.humanize}, you've successfully updated your profile!"
	end


	private

	def user_params
		params.require(:user).permit(:name, :height, :happiness, :nausea, :tickets, :admin)
	end

	def set_user
		@user = User.find(params[:id])
	end

end
