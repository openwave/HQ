class HighlightsController < ApplicationController

  def index
    @highlights = @org.highlights
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @highlights }
    end
  end

  def show
    @highlight = Highlight.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @highlight }
    end
  end

  def new
    @highlight = Highlight.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @highlight }
    end
  end
  
def myHQpage_admin_bulleted_lists
  @org=Org.find(1)
 @highlight = @org.highlights.build(params[:highlight])
 @tab=Tab.find(params[:tab_id])
 @highlights = Highlight.find(:all,:conditions => [ "tabid = ?" , params[:tab_id]])
 @events=@org.events
render :partial => '/highlights/bulleted_lists'

end

def bulleted_tab
@org=Org.find(params[:id])
@highlight=Highlight.new
@highlights = Highlight.find(:all,:conditions => [ "tabid = ?" , params[:tab_id]])
@events=@org.events
@tab=Tab.find(params[:tab_id])
render :partial => '/highlights/bulleted_lists'
end

def edit
 @highlight = Highlight.find(params[:id])
end
  
  def create
    @highlight = @org.highlights.build(params[:highlight])
    respond_to do |format|
      if @highlight.save
        #flash[:notice] = 'Highlight was successfully created.'
        format.html { redirect_to(@org, @highlight) }
        format.xml  { render :xml => @highlight, :status => :created, :location => @highlight }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @highlight.errors, :status => :unprocessable_entity }
      end
    end
  end
    
 def create_bullet
  @org = Org.find(params[:id])
    @highlight = @org.highlights.build(params[:highlight])
    @highlight.tabid=params[:tab_id]
    @tabs = @org.tabs
    @events = @org.events
    @tab=Tab.find(params[:tab_id])
  
    @highlight.save
   @highlights = Highlight.find(:all,:conditions => [ "tabid = ?" , params[:tab_id]])
      if @highlight.save
        render :partial => 'highlights/myHQpage_admin_bulleted_lists_example'  
 
end
end

 def myHQpage_bulleted_lists
    @org=Org.find(1)
      @highlights = @org.highlights
      @events=@org.events
 end
 
 
  

  def delete
      @tab=Tab.find(params[:tab_id])
     
    @highlight = Highlight.find(params[:id])
    @highlight.destroy
     @highlights = Highlight.find(:all,:conditions => [ "tabid = ?" , params[:tab_id]])
    render :partial =>'highlights/myHQpage_admin_bulleted_lists_example'
   end

  
  def voteup
 
    @highlight = Highlight.find(params[:id])
    #@highlight.position = @highlight.position  + 1
    @highlight.save
       render :text=>''
  end

  def votedown
    
    @highlight = Highlight.find(params[:id])
    #@highlight.position=@highlight.position -1
    @highlight.save
       render :text=>''
  end




  end

