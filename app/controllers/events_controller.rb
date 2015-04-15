class EventsController < ApplicationController
  helper_method :joined?
  def new
    @event = Event.new
  end

  def create
    @event = Event.new( user_id: current_user.id, task_id: params[:format] )
    if @event.save
      flash[:notice] = "Event created"
      redirect_to homes_path
    else
      flash[:notice] = "#{@event.errors.full_messages.first}"
      redirect_to tasks_path
    end
  end

  def show
    @event = Event.find( params[:id] )
    @message = Message.new
    @display_message = Message.where(event_id: params[:id])
  end

  private

  def joined?
     @event = Event.find( params[:id] )
    @event.attendees.each do |attendee|
      if attendee.user_id == current_user.id
        return true
      end
    end
    return false
  end
end
