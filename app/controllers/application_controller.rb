class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?, :admin?
  rescue_from ActiveRecord::RecordNotFound, with: :not_found 
	rescue_from Exception, with: :not_found
	rescue_from ActionController::RoutingError, with: :not_found
	# rescue_from ActionNotFound, with: :not_found

	def raise_not_found
		raise ActionController::RoutingError.new("No route matches #{params[:unmatched_route]}")
	end


  private

  def current_user
  	@user ||= User.find(session[:user_id]) unless session[:user_id].nil?
  end

  def logged_in?
  	!!current_user
  end

  def authenticate_user!
		redirect_to root_path, alert: "You must be logged in to view that page" unless logged_in?
	end

	def admin?
		current_user.admin
	end


	def not_found
		respond_to do |format|
			format.html { render :file => "#{Rails.root}/public/404", :layout => false, :status => :not_found }
			format.xml { head :not_found }
			format.any { head :not_found }
		end
	end	

	def process(action, *args)
    super
  	rescue AbstractController::ActionNotFound
    respond_to do |format|
      format.html { render :file => "#{Rails.root}/public/404", :layout => false, :status => :not_found  }
      format.all { render nothing: true, status: :not_found }
    end
  end




end
