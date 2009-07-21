class EventController < ApplicationController

 layout "layout"
 def index
    @event_pages, @events = paginate :events, :per_page => 15
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(params[:event])
    if @event.save
      redirect_to :action => 'index'
    else
      render :action => 'new'
    end
end

  def edit
    @event = Event.find(params[:id])
  end

def rate
@event = Event.find(:first, :conditions=>["id = ?",params[:id]])
  #@event = Event.find(params[:id])
 # Rating.find(["rateable_type = 'Event' AND rateable_id = ? ", @event.id])

@event.add_rating Rating.new(:rating => params[:rating])
@rat= Rating.find_all_by_rateable_id(@event.id)
 #@rat= Rating.rateable_id(@event.id)
 # @total_rating = Rating.find_all_by_rateable_id(@event.id).size
 end
end
