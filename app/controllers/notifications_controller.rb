class NotificationsController < ApplicationController
  before_filter :load_org

  def load_org
    # @org = Org.find(params[:id])
    @org = Org.find(3)
  end

  def index
    @notifications = Notification.all
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @notifications }
    end
  end

  def show
    @notification = Notification.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @notification }
    end
  end

  def new
    @notification = Notification.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @notification }
    end
  end

  def edit
    @notification = Notification.find(params[:id])
  end

  def create_original
    @notification = Notification.new(params[:notification])
    respond_to do |format|
      if @notification.save
        #flash[:notice] = 'Notification was successfully created.'
        format.html { redirect_to(@notification) }
        format.xml  { render :xml => @notification, :status => :created, :location => @notification }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @notification.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def create
    @notification = @org.notifications.build(params[:notification])
    respond_to do |format|
      if @notification.save
        #flash[:notice] = 'Notification was successfully created.'
        format.html { redirect_to(@org, @notification) }
        format.xml  { render :xml => @notification, :status => :created, :location => @notification }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @notification.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @notification = Notification.find(params[:id])
    respond_to do |format|
      if @notification.update_attributes(params[:notification])
       #flash[:notice] = 'Notification was successfully updated.'
        format.html { redirect_to(@notification) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @notification.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @notification = Notification.find(params[:id])
    @notification.destroy
    respond_to do |format|
      format.html { redirect_to(notifications_url) }
      format.xml  { head :ok }
    end
  end
end
