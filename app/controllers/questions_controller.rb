class QuestionsController < ApplicationController
	before_action :authenticate_user!
	before_action :no_auth

	def new
		@question = Question.new
		@poll = Poll.find(params[:poll_id])
	end

	def create
		@poll = Poll.find(params[:poll_id])
		@question = @poll.questions.create(question_param)

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
		@question.update(question_param)
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

	def question_param
		params.require(:question).permit(:statement)
	end

	def no_auth
  	unless current_user.admin?
  		redirect_to root_path
  	end
  end

end
