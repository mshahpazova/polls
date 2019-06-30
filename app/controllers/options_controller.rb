class OptionsController < ApplicationController

  def new
    @poll = Poll.find(params[:poll_id])
    @option = Option.new
  end

  def create
    @poll = Poll.find(params[:poll_id])
    @poll_option = @poll.options.create(options_params)
    redirect_to poll_path(@poll)
  end

  def destroy
    @poll_option = Option.find(params[:id]).destroy
    redirect_to poll_path(params[:poll_id])
  end

  private

  def options_params
    params.require(:option).permit(:poll_id, :id, :description)
  end
end
