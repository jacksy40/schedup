class MessagesController < ApplicationController

  def index
    # json_movies = Message.where(event_id: params,  }
    # respond_to do |format|
    #   format.js { render json: json_movies }
    # end
  end

  def create
  @event = Event.find(params[:event_id])
  @message = current_user.messages.new( message_params )
  @message.event_id = @event.id
  @message.save
  redirect_to event_path( params[:event_id] )
  end

  private

  def message_params
    params.require( :message ).permit( :message )
  end
end
