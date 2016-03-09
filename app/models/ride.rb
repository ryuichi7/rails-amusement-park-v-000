class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  
  def take_ride
  	if user.tickets < attraction.tickets && user.height < attraction.min_height
  		too_few_tickets_message + too_short_message.gsub("Sorry.", "")
  	elsif user.tickets < attraction.tickets 
  		too_few_tickets_message
  	elsif user.height < attraction.min_height
  		too_short_message
  	else
  		user.update(happiness: new_happiness, nausea: new_nausea, tickets: new_ticket_amount)
  	end
  end
  	

  def user_name
  	user.name
  end

  def attraction_name
  	attraction.name
  end

  def too_few_tickets_message
  	"Sorry. You do not have enough tickets the #{attraction_name}."
  end

  def too_short_message
  	"Sorry. You are not tall enough to ride the #{attraction_name}."
  end

  def new_happiness
  	user.happiness + attraction.happiness_rating
  end

  def new_nausea
  	user.nausea + attraction.nausea_rating
  end

  def new_ticket_amount
  	user.tickets - attraction.tickets
  end


end
