class FlowingsController < ApplicationController
  before_filter :load_org

  def load_org
    @org = Org.find(params[:org_id])
  end

  def index
    @flowings = @org.flowings.find(:all)
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @flowings }
    end
  end

  def show
    @flowing = Flowing.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @flowing }
    end
  end

  def new
    @flowing = Flowing.new
    @suggested = "Use this profile to write about your background, what makes you unique, your position in the market place, and what you want people to imagine when they see your company for the first time."
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @flowing }
    end
  end

  def edit
    @flowing = Flowing.find(params[:id])
  end

  def create
    @flowing = @org.flowings.build(params[:flowing])
    respond_to do |format|
      if @flowing.save
        flash[:notice] = 'Flowing was successfully created.'
        format.html { redirect_to(@org, @flowing) }
        format.xml  { render :xml => @flowing, :status => :created, :location => @flowing }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @flowing.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @flowing = Flowing.find(params[:id])
    respond_to do |format|
      if @flowing.update_attributes(params[:flowing])
        flash[:notice] = 'Flowing was successfully updated.'
        format.html { redirect_to(@org, @flowing) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @flowing.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @flowing = Flowing.find(params[:id])
    @flowing.destroy
    respond_to do |format|
      format.html { redirect_to(flowings_url) }
      format.xml  { head :ok }
    end
  end
end
