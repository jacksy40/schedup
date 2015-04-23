class MessagesController < ApplicationController

  def index
    @user = current_user.username
    @event = Event.find(params[:event_id])
    @message = @event.messages
    @response = { message: @message, user: @user}
    # respond_with ( @response )
    respond_to do |format|
      format.html
      format.js { render json: response }
    end
  end

  def create
  @event = Event.find(params[:event_id])
  @message = current_user.messages.new( message_params )
  @message.event_id = @event.id
  @message.save
  respond_to do |format|
    format.html
    format.js { render json: @message }
  end
  end

  private

  def message_params
    params.require( :message ).permit( :message )
  end
end
