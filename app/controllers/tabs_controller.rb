class TabsController < ApplicationController
  before_filter :load_org

  def load_org
    @org = Org.find(params[:org_id])
  end
  
  def index
    @tabs = @org.tabs.all
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @tabs }
    end
  end

  def show
    @tab = Tab.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @tab }
    end
  end

  def new
    @tab = Tab.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @tab }
    end
  end

  def edit
    @tab = Tab.find(params[:id])
  end

  def create_original
    @tab = Tab.new(params[:tab])
    respond_to do |format|
      if @tab.save
        #flash[:notice] = 'Tab was successfully created.'
        format.html { redirect_to(@tab) }
        format.xml  { render :xml => @tab, :status => :created, :location => @tab }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @tab.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def create
    @tab = @org.tabs.build(params[:tab])
    respond_to do |format|
      if @tab.save
        flash[:notice] = 'Tab was successfully created.'
        format.html { redirect_to(@org, @tab) }
        format.xml  { render :xml => @tab, :status => :created, :location => @tab }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @tab.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @tab = Tab.find(params[:id])
    respond_to do |format|
      if @tab.update_attributes(params[:tab])
        #flash[:notice] = 'Tab was successfully updated.'
        format.html { redirect_to(@org, @tab) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @tab.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @tab = Tab.find(params[:id])
    @tab.destroy
    respond_to do |format|
      format.html { redirect_to(tabs_url) }
      format.xml  { head :ok }
    end
  end
  
  def sort
    params[:tabs].each_with_index do |id, index|
      Tab.update_all(['position=?', index+1], ['id=?', id])
    end
    render :nothing => true
  end
end
