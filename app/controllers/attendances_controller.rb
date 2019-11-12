class AttendancesController < ApplicationController

  

  def upcoming
    @upcoming_events = current_user.upcoming
  end

  def past
    @past_events = current_user.past
  end
end
