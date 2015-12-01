class EventsController < ApplicationController
	before_action :require_login, only: [:new, :create, :show, :edit, :update, :delete]
	before_action :require_correct_event_user, only: [:edit, :update, :delete]

	def index
		@events = Event.all
		@user = current_user
		@joins = Join.where(user: @user)
	end

	def create
		user = User.find(current_user.id)
		user.events.create(name: params[:name], timing: params[:timing], location: params[:location], state: params[:state])
		if params[:timing] < Date.today.to_s	
		flash[:error1] = "Must add event for current or future date"	
			redirect_to "/events"
		else 
			user.save
			redirect_to "/events"
		end
	end

	def show
		@event = Event.find(params[:id])
		@comments = @event.comments
		@user = User.all
		@joins = Join.where(event:@event, user: @user)
	end

	def delete
		event = Event.find(params[:id])
		event.destroy
		redirect_to "/events"
	end

	def edit
		@event = Event.find(params[:id])
	end

	def update
		event = Event.find(params[:id])
		event.update(name: params[:name], location: params[:location], timing: params[:timing], state: params[:state])
		redirect_to "/events"
	end

	def join
		event = Event.find(params[:id])
		user = User.find(current_user)
		Join.create(user:user, event:event)
		redirect_to "/events"
	end

	def unjoin
		event = Event.find(params[:id])
		user = User.find(current_user)
		Join.find_by(user: user, event: event).destroy
		redirect_to "/events"
	end
end