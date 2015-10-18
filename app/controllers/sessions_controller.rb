class SessionsController < ApplicationController
	def new


	end

	def create
		user = User.find_by(email: params[:email])
		if user && user.authenticate(params[:password])
				session[:user_id] = user.id
				redirect_to "/events"
		else
			flash[:error2] = "Invalid credentials"
			redirect_to "/sessions/new"
		end
	end

	def logout
		session[:user_id] = nil
		redirect_to "/sessions/new"
	end
end