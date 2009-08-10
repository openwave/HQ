class OrgsController < ApplicationController
  include Geokit::Geocoders
layout 'search',:only => [:index,:new,:create]

  before_filter :require_user, :only => [:edit, :update]
  before_filter :require_allowable_user, :only => [:edit, :update, :delete]
  
  def index
     if current_user
    @user_org = Org.find_by_user_id(current_user.id)
    end
    if params[:sort]
      if params[:sort] == "town"
        ip_addr = request.env['REMOTE_ADDR']
        location = IpGeocoder.geocode('12.215.42.19')
        latitude = location.lat
        longitude = location.lng
        lat = latitude.to_radians
        lng = longitude.to_radians
          @orgs = Org.search(
       (params[:search] || ""),
      :page => (params[:page] || 1),
      :geo => [lat,lng],
      :order => "@geodist ASC, @relevance DESC",
      :match_mode => :boolean,:include => :flowings,:conditions => ["publish = 1"]
      )

      else
      @orgs = Org.search(
       (params[:search] || ""),
      :page => (params[:page] || 1),
      :order => (params[:sort].to_sym),
      :sort_mode => :desc,
      :match_mode => :boolean,:include => :flowings,:conditions => ["publish = 1"]
      )
      end

    else
      @orgs = Org.search(
       (params[:search] || ""),
      :page => (params[:page] || 1),
      :match_mode => :boolean,:include => :flowings,:conditions => ["publish = 1"])
    end
    p '*************************'
    p @orgs.size
  end
  
  def rate
    @org = Org.find(params[:id])
    @user = User.find(1)
    @org.rate(params[:rating].to_i, @user)
    render :partial => "org_rating", :locals => {:org => @org}
  end
  
  def show
    @org = Org.find(params[:id])
    lat = @org.geocode.latitude
    long = @org.geocode.longitude
    @map = GMap.new("map_div")
    @map.control_init(:large_map => true,:map_type => true)
    @map.center_zoom_init([lat,long],15)
    @map.overlay_init(GMarker.new([lat,long], :title => "Information", :info_window => @org.title))
    respond_to do |format|
      format.html 
      format.xml  { render :xml => @org }
    end
  end
  
  def map
    @org = Org.find(params[:id])
    @lat = @org.geocode.latitude
    @lng = @org.geocode.longitude
  end
  
  def new
    @org = Org.new
    respond_to do |format|
      format.html
      format.xml  { render :xml => @org }
    end
  end
  
  def edit
    @org = Org.find(params[:id])
  end
  
  def create
   
    @org = Org.new(params[:org])
    @org.user_id = current_user.id
     @orgg=Org.new
         unless @org.valid?
               @org.errors.each {|k,v| @orgg.errors.add(k, v) }
         end
      if @org.save
        redirect_to :controller => :haml,:action => :myHQpage_admin,:id => @org.id 
       # format.xml  { render :xml => @org, :status => :created, :location => @org }
      else
         render :action => "new" 
       # format.xml  { render :xml => @org.errors, :status => :unprocessable_entity }
      end
 
  end

  
  def update
    @org = Org.find(params[:id])
    respond_to do |format|
      if @org.update_attributes(params[:org])
       #flash[:notice] = 'Org was successfully updated.'
        format.html { redirect_to :controller=>:haml,:action=>:myHQpage_admin,:id=>@org.id }
        format.xml  { head :ok }
      else
        format.html { render :action => "myHQadmin_organization_info" }
        format.xml  { render :xml => @org.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def save_image
    @org = Org.find(params[:id])
    @org.update(params[:image])
    
    #flash[:notice] = 'Org was successfully updated.'
        format.html { redirect_to :controller=>:haml,:action=>:myHQpage_admin,:id=>@org.id }
        format.xml  { head :ok }
  end
  
  def destroy
    @org = Org.find(params[:id])
    @org.destroy
    respond_to do |format|
      format.html { redirect_to(orgs_url) }
      format.xml  { head :ok }
    end
  end
  
  def require_allowable_user
    @org = Org.find(params[:id])
    if @org.user_id == current_user.id || current_user.hq_staff?
      @org = Org.find(params[:id])
    else
      #flash[:notice] = "Sorry, you do not have the ability to do that."
      redirect_to root_url
    end
  end
  
  def myHQpage_Write_a_Review
    @org = Org.find(2)
  end
  
  def myHQadmin_organization_info
    @org = Org.find(params[:id])
  end
  
  private
  def choose_layout
    if [ 'signup', 'login' ].include? action_name
      'login'
    else
      'admin'
    end
  end
  
end
