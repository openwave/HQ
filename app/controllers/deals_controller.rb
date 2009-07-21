class DealsController < ApplicationController
 # before_filter :load_org, :except => [:index]
  before_filter :require_user, :except => [:index, :show]
  layout 'search',:only => :index
 

 def index
    if current_user
    @user_org = Org.find_by_user_id(current_user.id)
    end
    if params[:deal]
       @deals = Deal.find(:all,params[:page],:order => 'rank DESC' )
      @deal_flag = false

   else
     @deal_flag = true
      if params[:sort]
        @deals = Deal.search(
        (params[:search] || ""),
        :page => (params[:page] || 1),
        :order => (params[:sort].to_sym),
        :sort_mode => :desc,
        :match_mode => :boolean)

      else
        @deals = Deal.search(
        (params[:search] || ""),
       :page => (params[:page] || 1),
        :order => :title,
        :match_mode => :boolean)
      end
   end
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @deals }
    end
  end
  
  
  def show
    @deal = Deal.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @deal }
    end
  end

  def new
    @deal = Deal.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @deal }
    end
  end

  def edit
    @deal = Deal.find(params[:id])
  end

  def create_original
    @deal = Deal.new(params[:deal])
    respond_to do |format|
      if @deal.save
        flash[:notice] = 'Deal was successfully created.'
        format.html { redirect_to(@deal) }
        format.xml  { render :xml => @deal, :status => :created, :location => @deal }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @deal.errors, :status => :unprocessable_entity }
      end
    end
  end

  def create
    @deal = @org.deals.build(params[:deal])
    @events=@org.events
    @deals= @org.deals
    if @deal.save
        render :template =>'deals/manageHQCard'
    end
  end
  
def manageHQCard
 @deal = @org.deals.build(params[:deal])
 @deals= Deal.find(:all)
 @events = Event.find(:all)
  end
  
 def deal
 render :template =>'deals/manageHQCard'
 end
 
  def update
    @deal = Deal.find(params[:id])
    respond_to do |format|
      if @deal.update_attributes(params[:deal])
        flash[:notice] = 'Deal was successfully updated.'
        format.html { redirect_to(@org, @deal) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @deal.errors, :status => :unprocessable_entity }
      end
    end
  end

  def delete
    @deals=@org.deals
    @deal = Deal.find(params[:id])
    @deal.destroy
   render :partial =>'deals/manage_hq_card_example'
   
  end

  def sort
    params[:deals].each_with_index do |id, index|
      Deal.update_all(['position=?', index+1], ['id=?', id])
    end
    render :nothing => true
  end
  
  def vote_up
    @deals=@org.deals
    @deal=Deal.find(params[:id])
    @deal.rank = @deal.rank + 1
    @deal.save
  end
  
    def vote_down
    @deals = @org.deals
    @deal=Deal.find(params[:id])
    @deal.rank = @deal.rank - 1
    @deal.save
    render :partial =>'/deals/manage_hq_card_example'
  end

    def manage_hq_card
      render :partial =>'manage_hq_card'
    end
end
