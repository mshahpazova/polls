class PollsController < ApplicationController
  def index
    @polls = Poll.all
  end

  def create
    @poll = Poll.create(poll_params)
    redirect_to polls_path
  end

  def show
    @poll = Poll.find(params[:id])
    @decorator = PollDecorator.new(@poll)
  end

  def new
    @poll = Poll.new
  end

  def edit
    @poll = Poll.find(params[:id])
  end

  def update
    @poll = Poll.find(params[:id])
    if @poll.update(poll_params)
      redirect_to @poll
    else
      render 'edit'
    end
  end

  def destroy
    Poll.find(params[:id]).destroy
    redirect_to polls_path
  end

  def vote
    if already_voted?(voter: params[:voter_name], poll_id: params[:id])
      flash[:notice] = 'You have already voted'
    else
      Vote.create(user_id: params[:voter_name], option_id: params[:option])
    end
    redirect_to poll_path(params[:id])
  end

  private

  def poll_params
    params.require(:poll).permit(:description, :poll_options)
  end

  def already_voted?(voter:, poll_id:)
    Poll.find(poll_id).votes.where(user_id: voter).size != 0
  end
end
