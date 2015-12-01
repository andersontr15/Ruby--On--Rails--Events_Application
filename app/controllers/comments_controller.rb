class CommentsController < ApplicationController
	before_action :require_login, only: [:new, :create, :show, :edit, :update, :delete]
	before_action :require_correct_user, only: [:show, :edit, :update, :delete]
	def index
	end

	def create
		event = Event.find(params[:id])
		user = session[:user_id]
		event.comments.create(comment: params[:comment], user_id: user)		
		redirect_to "/events/#{event.id}"
	end
end