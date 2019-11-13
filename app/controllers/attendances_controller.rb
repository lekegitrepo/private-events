class AttendancesController < ApplicationController

  def new
    @attendance = Attendance.new
  end

  def create
    @event = Event.find(params[:id])
    current_user.attend(@event)
    redirect_to @event
  end

  def cancel
    @event = Event.find(params[:id])
    current_user.cancel(@event)
    redirect_to @event
  end

  def upcoming
    @upcoming_events = current_user.upcoming
  end

  def past
    @past_events = current_user.past
  end
end
