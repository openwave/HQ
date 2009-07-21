class FactsController < ApplicationController
  before_filter :load_org

  def load_org
    @org = Org.find(params[:org_id])
  end
  
  def index
    @facts = @org.facts.find(:all)
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @facts }
    end
  end

  def show
    @fact = Fact.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @fact }
    end
  end

  def new
    @fact = Fact.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @fact }
    end
  end

  def edit
    @fact = Fact.find(params[:id])
  end

  def create
    @fact = @org.facts.build(params[:fact])
    respond_to do |format|
      if @fact.save
        #flash[:notice] = 'Fact was successfully created.'
        format.html { redirect_to(@org, @fact) }
        format.xml  { render :xml => @fact, :status => :created, :location => @fact }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @fact.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @fact = Fact.find(params[:id])
    respond_to do |format|
      if @fact.update_attributes(params[:fact])
        #flash[:notice] = 'Fact was successfully updated.'
        format.html { redirect_to(@org, @fact) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @fact.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @fact = Fact.find(params[:id])
    @fact.destroy
    respond_to do |format|
      format.html { redirect_to(facts_url) }
      format.xml  { head :ok }
    end
  end
end
