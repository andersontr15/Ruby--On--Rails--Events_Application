class UsersController < ApplicationController
	def new
		
	end

	def create
		user = User.new(first_name: params[:first_name], last_name: params[:last_name], email: params[:email], location: params[:location], state: params[:state], password: params[:password], password_confirmation: params[:password_confirmation])
		if user.password == user.password_confirmation
			user.save
			redirect_to "/sessions/new"
			flash[:success] = "You are now registered and may login."
		else
		flash[:error] = "Must fill out all fields and password fields must match"
		redirect_to "/users/new"
		end
	end

	def show
		user = User.find(params[:id])
	end

	def update
		user = User.find(params[:id])
		user.update(first_name: params[:first_name],last_name: params[:last_name],email: params[:email], state: params[:state],location: params[:location])
		redirect_to "/events"
	end
end
