class RidesController < ApplicationController

	def create
		@ride = Ride.create(attraction_id: params[:attraction_id], user_id: params[:user_id])
		action = @ride.take_ride
		if action == true
			redirect_to user_path(@ride.user), alert: "Thanks for riding the #{@ride.attraction_name}!"
		else
			redirect_to user_path(@ride.user), alert: "#{action}"
		end
	end

end
