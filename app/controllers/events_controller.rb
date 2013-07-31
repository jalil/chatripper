class EventsController < ApplicationController

  def index
    @events = Event.all.order('created_at ASC')
    @hour_five = Event.hourly_summary('05','06')
    @hour_six = Event.hourly_summary('06','07')
  end
end
