class PollsController < ApplicationController
	before_action :authenticate_user!
	before_action :no_auth, only: [:new, :create, :destroy]


	def index
		@polls = Poll.all
		@user = current_user
	end

	def show
		# print("Timeout", params[:timeout])
		@poll = Poll.find(params[:id])
		@answers = Answer.all
		@user = current_user

	end

	def new
		@poll = Poll.new
		render action: :new
	end

	def create
		@poll = Poll.create(poll_params)
		flash[:notice] = "Poll was successfully created"
  	if @poll.save
			redirect_to(poll_path(@poll))
		else
			render(:action=>:new)
		end
	end

	def destroy
		@poll = Poll.find(params[:id])
		@poll.destroy
		redirect_to(:action=>:index)
	end

	# Save the response
	def save
		@poll = Poll.find(params[:id])
		@user = current_user
		@question = Question.where(statement: params[:choice]).where(poll_id: params[:id]) # return array

		unless params[:choice]
			redirect_to(:action=>:show)
		else
			@answer = Answer.create({:user_id=>@user.id, :question_id=>@question[0].id, :poll_id=>@poll.id})
			redirect_to(:action=>:show)
		end
	end

	private 
	def poll_params
   	params.require(:poll).permit(:title)
  end

  def no_auth
  	unless current_user.admin?
  		redirect_to root_path
  	end
  end

end
