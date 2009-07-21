class PricesController < ApplicationController
  #before_filter :load_org

 

  def index
    @prices = @org.prices
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @prices }
    end
  end

 
def create_price
  @org=Org.find(params[:id])
    @price = Price.new
    @price.title = params[:title]
    @price.item=params[:item]
    @price.description=params[:description]
    @price.price=params[:price]
    @price.org_id = @org.id
    @tab=Tab.find(params[:main_tab])
    @price.main_tab= @tab.id
     puts "sssssssssssssssssssssssssssssssss#{params[:tab_type]}"
     puts "sssssssssssssssssssssssssssssssss#{params[:tab_id]}"
     puts "SSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSss#{params[:main_tab]}"
  
      if params[:tab_type] == 'tab_1'
        @price.tab_id = 1
        @price.save 
         prices = Price.find(:all,:conditions => [ "tab_id= ?" ,1])
        @prices = Price.find(:all,:conditions => [ "tab_id= ?" , 1])
      
      else  
         @price.tab_id= params[:tab_id]
         @price.save 
         prices = Price.find(:all,:conditions => [ "tab_id= ?" , params[:tab_id]])
        @prices = Price.find(:all,:conditions => [ "tab_id= ?" , params[:tab_id]])
      end
    if params[:photo]  
   @price.photo = params[:photo]
    end
    @price.save 
   

     @events=@org.events
      @price_tabs = @org.price_tabs
      render :partial => '/prices/myHQadmin_price_description_example',:locals => {:prices => prices}
end

def add_title
@org=Org.find(params[:id])
@tab=Tab.find(params[:main_tab])
render :partial =>'myHQpage_admin_price_description_add_title',:locals => {
    :item=>params[:item],:description=>params[:description],:price=>params[:price],:id=>@org.id,:tab_id=>params[:tab_id],:main_tab=>@tab.id,:edt=>false}
end

def new_title
  @org=Org.find(params[:id])
   @price = Price.new
  @price_tabs=@org.price_tabs
 # @prices=@org.prices

   @price.title = params[:title]
   @price.item=params[:item]
   @price.description=params[:description]
   @price.price=params[:price]
   @tab=Tab.find(params[:main_tab])
    @price.main_tab= @tab.id
    if params[:tab_type] == 'tab_1'
       @price.tab_id = 1
       @price.save
        @prices = Price.find(:all,:conditions => [ "tab_id= ?" , 1])
       
      else  
         @price.tab_id= params[:tab_id]
         @price.save
           @prices = Price.find(:all,:conditions => [ "tab_id= ?" , params[:tab_id]])
    end
#    @prices= Price.find
    @price.org_id = @org.id
   @price.save
  prices = @org.prices
  render :partial => '/prices/myHQadmin_price_description_example',:locals => {:prices => prices}
end

def add_image
  render :partial =>'add_image',:locals => {
    :item=>params[:item],:description=>params[:description],:price=>params[:price],:tab_id=>params[:tab_id],:edt=>false}
end

def new_image
   @price = Price.new
   @price_tabs=@org.price_tabs
    puts"d#{params[:tab_id]}"
    puts"#{params[:photo]}"
  # @price.photo = params[:price][:photo]
    @price.photo = params[:photo]
    # @prices=Price.find(:all,:conditions => [ "tab_id = ?" , tab_id])
   
    @prices=@org.prices
   @price.save
  prices = Price.find(:all)
  render :partial => '/prices/myHQadmin_price_description_example',:locals => {:prices => prices}
end



  def new
    @price = Price.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @price }
    end
  end

  def edit
    @price = Price.find(params[:id])
  end
  
  def myHQpage_price_description
    puts "DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD#{params[:id]}"
    @org=Org.find(params[:id])
    @prices = @org.prices.build(params[:price])
   # @pricetabs = @org.pricetabs
    @prices=@org.prices
    @events=@org.events
    @price=Price.new

    end
    
  def price_description
    @org=Org.find(params[:id])
      @tab=Tab.find(params[:main_tab])
      @price_tabs = PriceTab.find(:all,:conditions =>["main_tab=?",params[:main_tab]])
      @prices = Price.find(:all,:conditions => [ "tab_id= ?" , 1])
      render :template => 'prices/myHQpage_price_description',:locals=>{:main_tab=>@tab.id,:id=>@org.id}
  end
 
  
  def update
    @price = Price.find(params[:id])
    respond_to do |format|
      if @price.update_attributes(params[:price])
        flash[:notice] = 'Price was successfully updated.'
        format.html { redirect_to(@price) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @price.errors, :status => :unprocessable_entity }
      end
    end
  end

  def delete
    @org=Org.find(params[:org_id])
    @price = Price.find(params[:id])
      @price.destroy
  
      if params[:tab_id]  == 1 || ''
        @prices = Price.find(:all,:conditions => [ "tab_id= ?" , 1])
   else  
        @prices = Price.find(:all,:conditions => [ "tab_id= ?" , params[:tab_id]])
    end
  
    render :partial =>'prices/myHQadmin_price_description_example',:locals=>{:tab_id=>@price.tab_id}
  end
  
  
  def myHQpage_pricedescription
  @org=Org.find(params[:id])
  @prices = @org.prices
  @events=@org.events
  end
  
  def close
   # @org=Org.find(params[:id])
      render :text =>" "
  end
  
  def add_tab
    @org= Org.find(params[:id])
    puts "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA#{params[:main_tab]}"
    @tab=Tab.find(params[:main_tab])
    render :partial => 'prices/myHQpage_admin_price_description_new_tab' ,:locals=>{:main_tab=>@tab.id}
  end
  
def myHQpage_price_description
  @price_tabs = @org.price_tabs
  @prices=@org.prices
  @events=@org.events
 # @price_tab=PriceTab.find(1)
  
end
  
  def create_tab
     @org = Org.find(params[:id])
     @price_tab = PriceTab.new
     @price_tab.tab_name = params[:tab_name]
     @price_tab.main_tab=params[:main_tab]
     @price_tab.org_id = @org.id
     @price_tab.save
   
     @price_tabs = PriceTab.find(:all,:conditions =>["main_tab=?",params[:main_tab]])
    
     @tab=Tab.find(params[:main_tab])
     @prices=@org.prices
     @events=@org.events
     #render :partial =>'prices/add_tab_prices' ,:locals=>{:main_tab=>@tab.id}
     render :partial =>'prices/add_tab_prices'
  end
  
  def list_prices
    @org=Org.find(params[:id])
    @price_tabs = @org.price_tabs
    @pricetab = PriceTab.find(params[:tab_id])
    @tab=Tab.find(params[:main_tab])
    @prices = Price.find(:all,:conditions => [ "tab_id = ?" , params[:tab_id]])
    render :partial =>'prices/list_prices',:locals => {:edt => true,:main_tab=>@tab.id}
  end
    
  def voteup
    render :text =>''
    @price=Price.find(params[:id])
    @price.position= @price.position + 1
    @price.save
  end
  
    def votedown
    render :text =>''
    
    @price=Price.find(params[:id])
    @price.position= @price.position - 1
    @price.save
  end
  
  

end
