class AttractionsController < ApplicationController
	before_action :set_attraction, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user!, except: [:create, :new, :edit]

	def index
		@attractions = Attraction.all
	end

	def new
		if logged_in? && admin?
			@attraction = Attraction.new
		else
			redirect_to root_path, alert: "access denied."
		end
	end

	def create
		if logged_in? && admin?
			@attraction = Attraction.create(attraction_params)
			redirect_to @attraction, notice: "Attraction was successfully created."
		else
			redirect_to root_path, alert: "access denied."
		end
	end

	def show
		
	end

	def edit
		unless logged_in? && admin?
			redirect_to root_path, alert: "access denied."
		end
	end

	def update
		@attraction.update(attraction_params)
		redirect_to @attraction, notice: "Attraction was successfully updated."
	end

	def destroy
	end

	private

	def attraction_params
		params.require(:attraction).permit(:name, :min_height, :happiness_rating,
			:nausea_rating, :tickets)
	end

	def set_attraction
		@attraction = Attraction.find(params[:id])
	end


end
