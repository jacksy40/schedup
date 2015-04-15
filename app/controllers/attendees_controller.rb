class AttendeesController < ApplicationController

  def create
  @event = Event.find(params[:format])
  @attendee = Attendee.new( user_id: current_user.id, event_id: params[:format] )
    if @attendee.save
      flash[:notice] = "Joined"
      redirect_to event_path(@event)
    else
      flash[:notice] = "#{@attendee.errors.full_messages.first}"
      redirect_to event_path(@event)
    end
  end

  def destroy
    @attendee = Attendee.where( user_id: current_user.id, event_id: params[:id] )
    @attendee.each do |a|
      a.destroy
      if a.destroy
        flash[:notice] = "Deleted"
      else
        flash[:notice] = "Delete failed"
      end
    redirect_to event_path(params[:id])
    end
  end
end
