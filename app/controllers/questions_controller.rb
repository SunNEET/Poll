class QuestionsController < ApplicationController
	before_action :authenticate_user!

	def new
		@question = Question.new
	end

	def create
		@poll = Poll.find(params[:poll_id])
		@question = @poll.questions.create(param_event)

		if @question.save
			redirect_to(poll_path(@poll))
		else
			render(:action => "new")
		end
	end

	def edit
		@poll = Poll.find(params[:poll_id])
		@question = Question.find(params[:id])
	end

	def update
		@poll = Poll.find(params[:poll_id])
		@question = Question.find(params[:id])
		@question.update(param_event)
		if @question.save
			redirect_to(poll_path(@poll))
		else
			render(:action => "edit")
		end
	end

	def destroy
		@poll = Poll.find(params[:poll_id])
		@question = @poll.questions.find(params[:id])
		@question.destroy
		redirect_to(:controller=>:polls, :action=>:show, :id=>params[:poll_id])
	end

	private

	def param_event
		params.require(:question).permit(:statement)
	end

end
