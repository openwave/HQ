class EventsController < ApplicationController
  before_filter :load_org

  def load_org
    @org = Org.find(1)
  end

  def index

    @events = @org.events
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @events }
    end
  end


def add_event
  puts "qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq#{params[:id]}"
  @org = Org.find(params[:id])
  @event = @org.events.build(params[:event])
  render :partial =>'new'
end

def add_image
  render :partial =>'add_image'
end

  def show
    @event = Event.find(params[:id])
    lat = @event.geocode.latitude
    long = @event.geocode.longitude
    @map = GMap.new("map_div")
    @map.control_init(:large_map => true,:map_type => true)
    @map.center_zoom_init([lat,long],15)
    @map.overlay_init(GMarker.new([lat,long], :title => "Information", :info_window => @event.id))
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @event }
    end
  end

  def new
    @org = Org.find(params[:id])
    @event = @org.events.build(params[:event])
    @event = Event.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @event }
    end
  end




   def myHQpage_admin_sales_calendar
  @events = @org.events
   end


  def sales_calendar_example
    @events= @org.events
  end

  def create
    @org = Org.find(params[:org_id])
    @facttts = Fact.find_all_by_org_id(params[:id])
    @event = @org.events.build(params[:event])
    @events=@org.events
    @tabs=@org.tabs
    if @event.save
    render :template => 'haml/myHQpage_admin'
    end
  end


  def delete
    @org = Org.find(params[:org_id])
    @event = Event.find(params[:id])
    @events=@org.events
    @event.destroy
  render :partial =>'/haml/sales_calendar_example'
  end

end