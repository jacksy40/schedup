class EventsController < ApplicationController
  helper_method :joined?

  def index
    load_hours
    @events = Event.all
  end

  def new
  @event = Event.new
  end

  def create
    @event = Event.new( user_id: current_user.id, task_id: params[:format] )
    if @event.save
      flash[:notice] = "Event created"
      redirect_to events_path
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

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    if @event.destroy
      flash[:notice] = "Event is canceled."
    else
      flash[:notice] = "This event does not belong to you."
    end
    redirect_to events_path
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
