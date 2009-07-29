class HamlController < ApplicationController
  include Geokit::Geocoders
  require 'rubygems'
  require 'RMagick'
  include Magick
  before_filter :require_user,:except =>[:myHQpage_Event,:myHQpage,:submit_review,:userReviews,:report_form,:submit_report_form,:review_rank,:myHQpage_notification,:submit_notifications,:map,:update_deal_image,:myHQpage_Event,:show_video,:show_photo,:calendar_voteup,:calendar_votedown,:choose_tab,:list_price_items,:myHQpage_Write_a_Review]
  $map = 0
  
  $flag=0
  $search=1
  $review = 0
  def publish
    @org = Org.find(params[:id])
    n = 0
    p = 0
    if @org.facts.size >= 1
      if @org.tabs.size >= 5
        if @org.logo == 1
          for @gallery in @org.galleries
            n = n + @gallery.photos.size
          end
          if n >= 10
            for @gallery in @org.galleries
              for @photo in @gallery.photos
                if @photo.default == true
                  p = p + 1
                end
              end
            end
            if p >= 1
              @org.publish = true
              @org.save
              redirect_to :action => 'myHQpage',:id => @org.id
            end
          end
        end
      end
    end
    redirect_to :action => 'myHQpage',:id => @org.id
  end
  
  def myHQpage_Write_a_Review
    @org = Org.find(params[:id])
    redirect_to :action => 'myHQpage', :id => @org.id ,:review => 1
  end
  
  def myHQpage_Event
    @org= Org.find(params[:org_id])
    @flowing = @org.flowing
    @event = Event.find(params[:id])
    @events = @org.events
    render :partial =>'/haml/myHQpage_Event'
  end
  
    def myHQpage_admin_Event
    @org= Org.find(params[:org_id])
    @flowing = @org.flowing
    @event = Event.find(params[:id])
    @events = @org.events
    render :partial =>'/haml/myHQpage_admin_Event'
  end
  
  
  def myHQpage
    @org= Org.find(params[:id])
    if params[:review]
      $review = params[:review]
      @reviews = @org.reviews.find(:all,:order => 'rank DESC')
      p @reviews
    end
    
    @events = @org.events
    @deals = @org.deals
    @tabs = @org.tabs
    @facts = @org.facts
    @default_video=@org.videos.find_by_default(1)
    @default_gallery=@org.galleries.find_by_default(1)
    puts " ********************************************************* video ************* #{@default_video.type}"
    puts " ********************************************************* video ************* #{@default_gallery.type}"
    if @default_gallery 
      @s3=''
      for @gallery in @org.galleries
        for @photo in  @gallery.photos
          if @photo.gallery_id.to_i == @default_gallery.id.to_i
            @s3<<"<track><title>photo</title><location>#{@photo.image.url.gsub(/\?.*/,'')}</location><info>gallery</info></track>"
          end
        end
      end
      @s1="<playlist version='1' xmlns='http://xspf.org/ns/0/'><trackList>"
      @s2="</trackList></playlist>"
      @s=@s1<<@s3<<@s2
      file=File.new("./public/playlist.xml", "w")
      file.puts @s
      file.close
    elsif @default_video
      @video = Video.find(@default_video.id)
      @org = Org.find(@default_video.org_id)
    else      
    end
    
  end
  
  def submit_review
    @org = Org.find(params[:id])
    @flowing = @org.flowing
    @events = @org.events
    @deals = @org.deals
    @tabs = @org.tabs
    @review = Review.new
    @review.name = params[:name]
    @review.town = params[:town]
    @review.content = params[:content]
    @review.org_id = @org.id
    @facts = @org.facts
    @review.save
    redirect_to :action => 'myHQpage',:id => @org.id
  end
  
  def userReviews
    @org = Org.find(params[:id],:include => :reviews)
    @reviews = @org.reviews.find(:all,:order => 'rank DESC')
    redirect_to :action => 'myHQpage', :id => @org.id ,:review => 2
  end
  
  def admin_userReviews
    @org = Org.find(params[:id],:include => :reviews)
    @reviews = @org.reviews.find(:all,:order => 'rank DESC')
    redirect_to :action => 'myHQpage_admin', :id => @org.id ,:review => 1
  end
  
  def report_form
    @review = Review.find(params[:review_id])
    render :partial => '/haml/report_form'
  end
  
  def submit_report_form
    @review = Review.find(params[:id])
    @review_report= @review.review_reports.new
    @review_report.review_id = @review.id
    @review_report.content = params[:review_report][:content]
    #@review_report.user_id = currentuser.id
    @review_report.save
    RequestMailer.deliver_send_report(@review_report,@review)
    render :text => " "
  end
  
  def review_rank
    
    if params[:vote_type]  == 'up'
      @review = Review.find(params[:id])
      if session[:review_votes].empty?
        @review.rank = @review.rank + 1
        session[:review_votes]=params[:id]
      else
        session[:review_votes].each do |vote|
          if vote != params[:id]
            @review.rank = @review.rank + 1
            session[:review_votes]=params[:id]
          end
        end
      end
    else
      @review = Review.find(params[:id])
      if @review.rank == 0
        @review.rank = 0
      else
        if session[:review_votes].empty?
          @review.rank = @review.rank - 1
          session[:review_votes]=params[:id]
        else
          session[:review_votes].each do |vote|
            if vote != params[:id]
              @review.rank = @review.rank - 1
              session[:review_votes]=params[:id]
            end
          end
        end
      end
    end
    @review.save
    @org = Org.find(@review.org_id)
    @reviews = @org.reviews.find(:all,:order => 'rank DESC')
    render :partial => '/haml/myHQpage_user_reviews'
  end
  
  def myHQpage_contact
    @org = Org.find(params[:id])
    @facts = @org.facts
    @user = current_user
    render :partial => '/haml/myHQpage_contact'
    
  end
  
  def contact_mail
    @org = Org.find(params[:id])
    @flowing = @org.flowing
    @events = @org.events
    @deals = @org.deals
    @tabs = @org.tabs
    @user = User.find(params[:user_id])
    @contact = @org.contacts.create(params[:contact])
    @contact.user_id = @user.id
    @contact.save
    @admin = User.find(@org.user_id)
    RequestMailer.deliver_contact_mail_org(@org,@user,@contact,@admin)
    RequestMailer.deliver_contact_mail_user(@org,@user,@contact,@admin)
    @facts = @org.facts
    redirect_to :action => 'myHQpage',:id => @org.id
    
  end
  def myHQpage_notification
    @org = Org.find(params[:id])
    @user = current_user
    render :partial => '/haml/myHQpage_Notifications'
  end
  
  def submit_notifications
    @org = Org.find(params[:id])
    @facts = @org.facts
    
    @notification = Notification.new
    @notification.org_id = @org.id
    @notification.user_id = params[:user_id]
    @notification.promotion = params[:promotions]
    @notification.deal = params[:deals]
    @notification.news = params[:products]
    @notification.save
    redirect_to :action => 'myHQpage',:id => @org.id
  end
  
  def map
    @org = Org.find(params[:id])
    @facts = @org.facts
    @flowing = @org.flowing
    @events = @org.events
    @deals = @org.deals
    @tabs = @org.tabs
    @lat = @org.geocode.latitude
    @lng = @org.geocode.longitude
    $map = 1
    render :template=> '/haml/myHQpage'
  end
  
  
  def myHQpage_admin
    @org = Org.find(params[:id],:include => [:galleries,:facts])
    if params[:flag]
      $flag = params[:flag]
      puts " *************************************************** FLAG in ADMIN**************************** #{$flag}"
    end
    if params[:video_id]
      @video=Video.find(params[:video_id])
    end
    if params[:photo_id]
      @photo=Photo.find(params[:photo_id])
    end
    @org = Org.find(params[:id],:include => [:galleries,:facts])
    if params[:review]
      $review = params[:review]
      @reviews = @org.reviews.find(:all,:order => 'rank DESC')
      p @reviews
    end
    @facttts = Fact.find_all_by_org_id(params[:id])
    @events=@org.events
    @tabs = @org.tabs
    
    @fact_title_count = Fact.count( :conditions => { :org_id => @org.id } )
    
    if @org.facts.empty?
      @fact = Fact.new
    end
    
    
  end
  
  def myHQadmin_org_info
    @org = Org.find(params[:id])
    @tabs = @org.tabs
  end
  def org_update
    
    @org = Org.find(params[:id])
    @tabs = @org.tabs
    @events=@org.events
    respond_to do |format|
      if @org.update_attributes(params[:org])
        # flash[:notice] = 'Org was successfully updated.'
        format.html { redirect_to :controller=>:haml,:action=>:myHQpage_admin,:id=>@org.id }
        format.xml  { head :ok }
      else
        format.html { render :action => "myHQadmin_organization_info" }
        format.xml  { render :xml => @org.errors, :status => :unprocessable_entity }
      end
    end
  end
  def addPhotos
    @org = Org.find(params[:id], :include => :galleries)
    @tabs = @org.tabs
    @galleries = @org.galleries
    @photo = Photo.new
  end
  
  def myHQpage_Event
    @org=Org.find(params[:org_id])
    @flowing = @org.flowing
    @event = Event.find(params[:id])
    @events=@org.events
    render :template =>'/haml/myHQpage_Event'
  end
  
  
  
  def save_photos
    @org = Org.find(params[:id])
    @tabs = @org.tabs
    @events=@org.events
    
    if  params[:gallery_id] == '0'
      @gallery = Gallery.new
      @gallery.title = params[:gallery_name]
      @gallery.org_id = params[:id]
      @gallery.save!
    else
      @gallery = Gallery.find(params[:gallery_id])
    end
    
    @photo = @gallery.photos.build(params[:photo])
    @photo.gallery_id = @gallery.id
    @photo.save!
    redirect_to :action =>'myHQpage_admin',:id => @org.id
  end
  
  def addVideos
    @org = Org.find(params[:id])
    @tabs = @org.tabs
    @video = Video.new
    @events=@org.events
  end
  
  def save_videos
    @org = Org.find(params[:id])
    puts "*************************************************params ****************************#{params[:video]} "
    @video =  Video.new(params[:video])
    @tabs = @org.tabs
    @events=@org.events
    @video.org_id = @org.id
    
    @video.save
    @org.video_count += 1
    @org.save
    @video.convert
    @video.upload_to_s3
  
    redirect_to :action =>'user_video_thumb_selection',:id => @org.id,:video_id =>@video.id
    
  end
  def user_video_thumb_selection
    @org=Org.find(params[:id])
    @video=Video.find(params[:video_id])
    @tabs = @org.tabs
    @events=@org.events
    redirect_to :action =>'myHQpage_admin',:id => @org.id,:video_id =>@video.id,:flag => 3
  end
  
  def update_video_thumb
    puts " **********************************Update_video_thumb called ***********************"
    @org=Org.find(params[:org_id])
    @video=Video.find(params[:id])
    file_name =params[:file_name]
    new_name="#{@video.id}.jpg"
    
    if file_name != "#{@video.id}.jpg"
      puts " **********************************if condition true ***********************"
      f=File.delete("./public/system/videos/#{@video.id}/original/#{@video.id}.jpg")
      File.rename("./public/system/videos/#{@video.id}/original/#{params[:file_name]}","./public/system/videos/#{@video.id}/original/#{@video.id}.jpg")
    end
    redirect_to :action =>'myHQpage_admin',:id => @org.id
  end
  
  
  def create_profile
    @org = Org.find(params[:id])
    @tabs = @org.tabs
    @events=@org.events
    if @org.profile.nil?
      
      @profile = Profile.new
      @profile.content = params[:profile][:content]
      @profile.org_id = params[:id]
      @profile.save
    else
      @profile = @org.profile
      @profile.update_attributes(params[:profile])
    end
    redirect_to :action =>'myHQpage_admin',:id => @org.id
  end
  
  def more_facts
    @org = Org.find(params[:id])
    @tabs = @org.tabs
    @events=@org.events
    render :partial => '/haml/more_facts'
  end
  
  def save_facts
    @org = Org.find(params[:id])
    p '2222222222222222222222222222222222222@@@@@@########################'
    if params[:flowing] == nil
      p '2222222222222222222222222222222222222@@@@@@@@@@@@@@@@@@@@@@@@@@'
      @facts_all = Fact.find_all_by_org_id(params[:id])
      Fact.delete(@facts_all)
      @org = Org.find(params[:id])
      @tabs = @org.tabs
      @events=@org.events
      @facts_title1 = @org.facts.find_by_title(params[:title1])
      @facts_title2 = @org.facts.find_by_title(params[:title2])
      
      
      if @facts_title1
        @facts_title1.content = params[:facts][:content1]
        @facts_title1.save
      else
        @facts_save = Fact.new
        @facts_save.org_id = params[:id]
        @facts_save.title = params[:title1]
        @facts_save.content = params[:facts][:content1]
        @facts_save.save
      end
      
      if params[:title2] != "Remove Quick Fact"
        if @facts_title2
          @facts_title2.content = params[:facts][:content2]
          @facts_title2.save
        else
          @facts_save = Fact.new
          @facts_save.org_id = params[:id]
          @facts_save.title = params[:title2]
          @facts_save.content = params[:facts][:content2]
          @facts_save.save
        end
        
        @facts_size = params[:facts].size
        
        if params[:title3] != "Remove Quick Fact"
          if params[:check] == "1"
            if @facts_size == ( 3 || 4) || params[:facts][:title3].empty?
              @facts_title3 = @org.facts.find_by_title(params[:title3])
              if @facts_title3
                @facts_title3.content = params[:facts][:contentt3]
                @facts_title3.save
              else
                @facts_save = Fact.new
                @facts_save.org_id = params[:id]
                @facts_save.title = params[:title3]
                @facts_save.content = params[:facts][:contentt3]
                @facts_save.save
              end
            else
              @facts_textfield_title3 = @org.facts.find_by_title(params[:facts][:title3])
              if @facts_textfield_title3
                @facts_textfield_title3.content = params[:facts][:contente3]
                @facts_textfield_title3.save
              else
                @facts_save = Fact.new
                @facts_save.org_id = params[:id]
                @facts_save.title = params[:facts][:title3]
                @facts_save.content = params[:facts][:contente3]
                @facts_save.save
              end
            end
          else
            if params[:title3] == "Custom"
              @facts_save = Fact.new
              @facts_save.org_id = params[:id]
              @facts_save.title = params[:facts][:titlee3]
              @facts_save.content = params[:facts][:contente3]
              @facts_save.save
            else
              @facts_save = Fact.new
              @facts_save.org_id = params[:id]
              @facts_save.title = params[:title3]
              @facts_save.content = params[:facts][:contentt3]
              @facts_save.save
            end
          end
        end
      end
      redirect_to :action => :myHQpage_admin, :id =>@org.id
    else
      
      p params[:flowing][:content]
      p params[:id]
      @org = Org.find(params[:id])
      
      if @org.flowing.nil?
        p 'pppppppppppppppppppppppppppp222222222222222222222222222222222222'
        @flowing = Flowing.new
        @flowing.content = params[:flowing][:content]
        @flowing.org_id = params[:id]
        @flowing.save!
      else
        
        @flowing = @org.flowing
        @flowing.content = params[:flowing][:content]
        @flowing.save!
      end
      
      
      redirect_to :action =>'myHQpage_admin',:id => @org.id
    end 
  end
  
  def show_video
    @video = Video.find(params[:id])
    @org = Org.find(params[:org_id])
    
    @tabs = @org.tabs
  end
  
  def show_photo
    puts " ********************************************* SHOW PHOTO ************************* "
    @org = Org.find(params[:id])
    @tabs = @org.tabs
    @events=@org.events
    @s3=''
    for @gallery in @org.galleries
      for @photo in  @gallery.photos
        if @photo.gallery_id.to_i == params[:gallery_id].to_i
          @s3<<"<track><title>photo</title><location>#{@photo.image.url.gsub(/\?.*/,'')}</location><info>gallery</info></track>"
        end
      end
    end
    @s1="<playlist version='1' xmlns='http://xspf.org/ns/0/'><trackList>"
    @s2="</trackList></playlist>"
    @s=@s1<<@s3<<@s2
    file=File.new("./public/playlist.xml", "w")
    file.puts @s
    file.close
    
  end
  
  def contact
    
    @org = Org.find(params[:id])
    @tabs = @org.tabs
    @events=@org.events
    if @org.contact_24 == false
      @org.contact_24 = true
      
    end
    if @org.save
      redirect_to :action =>'myHQpage_admin',:id => @org.id
    end
  end
  
  def deactivate_contact
    
    @org = Org.find(params[:id])
    @tabs = @org.tabs
    @events=@org.events
    if @org.contact_24 == true
      @org.contact_24 = false
      
    end
    if @org.save
      redirect_to :action =>'myHQpage_admin',:id => @org.id
    end
  end
  
  def contact_button
    @org = Org.find(params[:id])
    @tabs = @org.tabs
    @events=@org.events
    if @org.contact_24 == true
      @org.contact_24 = false
    else
      @org.contact_24 = true
    end
    if @org.save
      redirect_to :action =>'myHQpage_admin',:id => @org.id
    end
  end
  
  def map_it
    @org = Org.find(params[:id])
    @tabs = @org.tabs
    @events=@org.events
    if @org.map_it == true
      @org.map_it = false
    else
      @org.map_it = true   
    end
    if @org.save
      redirect_to :action =>'myHQpage_admin',:id => @org.id
    end
  end
  
  def sales_show
    @org = Org.find(params[:id]) 
    @tabs = @org.tabs
    @events=@org.events
    if @org.calender_status == true
      @org.calender_status = false
      @org.save
      render :partial => 'haml/calender_status',:locals=>{:calender_status=>false}
    else
      @org.calender_status = true
      @org.save
      render :partial => 'haml/calender_status',:locals=>{:calender_status=>true}
    end
  end
  
  def myHQadmin_flowing_text
    @org = Org.find(params[:id])
    @tabs = @org.tabs
    @events=@org.events
  end
  
  def sales_calendar_change_calendar
    
    @org=Org.find(params[:org_id])
    @tabs = @org.tabs
    render :partial =>'haml/sales_calendar_change_calendar',:locals => {:calender_status=>@org.calender_status}
  end
  
  def change_logo
    @org = Org.find(params[:id])
    @tabs = @org.tabs
    @events=@org.events
    render :template => '/haml/logo_upload'
  end
  
  def save_logo_upload
    @org = Org.find(params[:id])
    @tabs = @org.tabs
    @events=@org.events
    if @org.update_attributes(params[:orgs])
      puts " ****************************************** UPDATE ATTRI IN SAVE_LOGO_UPLOAD***********************"
      @org.logo = 1
      @org.save
    end
    # image=Image.read("/home/openwave/flower.png").first
    # face=image.crop!(270,55,194,194)
    # face.write("/home/openwave/flower.png")
    #  render :template => '/haml/myHQpage_admin'
    redirect_to  :action => 'change_logo_image_crop' ,:id => @org.id
  end
  
  def change_logo_image_crop
    @org= Org.find(params[:id])
    
    @tabs = @org.tabs
    @events=@org.events
    puts "***************************************FLAG-0*********************** #{$flag}"
    puts "***************************************FLAG-1*********************** #{$flag}"
    redirect_to :action =>'myHQpage_admin',:id => @org.id,:flag => 1
    # render :action =>'myHQpage_admin'
    return
  end
  
  def update_logo_upload
    @org = Org.find params[:id]
    puts " ********************************* params[orgs] ******************* #{params[:orgs]}"
    @events=@org.events
    @tabs = @org.tabs
    @org.update_attributes(params[:orgs])
    # @org.image = File.new(@org.image.path)
    @org.upload_to_s3
    #render :partial => '/haml/viewer_placeHolder',:locals =>{:org_id=>@org.id}
    redirect_to :action =>'apply_logo_change',:id =>@org.id
  end
  
  def apply_logo_change
    @org=Org.find(params[:id])
    
  end
  def create_video
    @org = Org.find(params[:id])
    @tabs = @org.tabs
    @events=@org.events
  end
  
  def submit_video
    @org = Org.find(params[:id],:include => :video_requests)
    @events=@org.events
    @tabs = @org.tabs
    @video_request = @org.video_requests.create(params[:video_request])
    RequestMailer.deliver_send_request(@video_request)
    #flash[:notice] = 'Your Request for video creation has been successfully submitted!'
    redirect_to :action =>'myHQpage_admin',:id => @org.id
  end
  
  def default_photo
    @org = Org.find(params[:id])
    @tabs = @org.tabs
    @events=@org.events
    @photo = Photo.new
  end
  
  def set_default
    @org = Org.find(params[:id])
    @tabs = @org.tabs
    @events=@org.events
    @gallery = @org.galleries.find(:last)
    @org.galleries.each do |g|
      g.photos.each do |p|
        if p.default == true
          p.default = false
          
          p.save!
        end
      end
    end
    @photo = @gallery.photos.build(params[:photo])
    @photo.gallery_id = @gallery.id
    @photo.default = 1
    
    @photo.save!
    #flash[:notice] = 'Submitted photo has been successfully set as your search result image!'
    #redirect_to :action =>'myHQpage_admin',:id => @org.id
    
    redirect_to  :action => 'set_default_image_crop' ,:id => @org.id,:photo_id   =>@photo.id
  end
  def set_default_image_crop
    @org= Org.find(params[:id])
    @photo=Photo.find(params[:photo_id])
    
    @tabs = @org.tabs
    @events=@org.events
    puts "***************************************FLAG-0*********************** #{$search}"
    $search=0
    puts "***************************************FLAG-1*********************** #{$search}"
    redirect_to :action =>'myHQpage_admin',:id => @org.id,:photo_id => @photo.id,:flag => '4'
    # render :action =>'myHQpage_admin'
    return
  end
  def update_set_search_result
    @org = Org.find params[:id]
    @photo= Photo.find(params[:photo_id])
    puts " ********************************* params[orgs] ******************* #{params[:orgs]}"
    @events=@org.events
    @tabs = @org.tabs
    @photo.update_attributes params[:orgs]
    # @org.image = File.new(@org.image.path)
    @photo.upload_to_s3
    redirect_to :action =>'apply_changes',:id => @org.id
  end
  def apply_changes
    @org=Org.find(params[:id])
  end
  def make_default
    @org = Org.find(params[:id],:include => :galleries)
    
    @galleries = @org.galleries.find(:all)
    @videos = @org.videos
    @tabs = @org.tabs
    @videos.each do |v|
      v.default = false
      v.save!
    end
    @galleries.each do |g|
      g.default = false
      g.save!
    end
    @gallery = Gallery.find(params[:gallery_id])
    @gallery.default = 1
    @gallery.save!
    render :partial => '/haml/photo_widget',:locals=>{:org => @org}
  end
  
  def gallery_delete
    @org = Org.find(params[:id],:include => :galleries)
    @gallery = Gallery.find(params[:gallery_id])
    @tabs = @org.tabs
    @photos = @gallery.photos.find(:all)
    @photos.each do |p|
      Photo.delete(p.id)
    end
    Gallery.delete(@gallery.id)
    
    render :partial => '/haml/photo_widget',:locals=>{:org => @org}
  end
  
  def make_default_video
    @org = Org.find(params[:id],:include => :videos)
    @galleries = @org.galleries
    @videos = @org.videos.find(:all)
    @tabs = @org.tabs
    @videos.each do |v|
      v.default = false
      v.save!
    end
    @galleries.each do |g|
      g.default = false
      g.save!
    end
    @video = Video.find(params[:video_id])
    @video.default = 1
    @video.save!
    render :partial => '/haml/video_widget',:locals=>{:org => @org}
  end
  
  def video_delete
    @org = Org.find(params[:id],:include => :videos)
    @video = Video.find(params[:video_id])
    @tabs = @org.tabs
    Video.delete(@video.id)
    @org.video_count = @org.video_count-1
    @org.save
    p '%%%%%%%%%%%%%%%%%%%%%%%%%%%%5555'
    p @org.videos.size
    p ' %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5'
    render :partial => '/haml/video_widget',:locals=>{:org => @org}
  end
  
  def close
    @org=Org.find(params[:id])
    redirect_to :action => 'myHQpage_admin',:id =>@org.id
  end
  
  def addNewTab
    @org = Org.find(params[:id])
    @tabs = @org.tabs
    @events=@org.events
    @facttts = Fact.find_all_by_org_id(params[:id])
    if @org.facts.empty?
      @fact = Fact.new
    end
    
    redirect_to :action => 'myHQpage_admin',:id =>@org.id,:flag => 2
  end
  
  def addNewTab2
    @org = Org.find(params[:id])
    
    @tab_type = params[:tab_type]
    @tab = Tab.new
    render :template => '/haml/addNewTab2'
  end
  
  
  def delete_tab
    @org = Org.find(params[:id])
    @events = @org.events
    @tabs = @org.tabs
    @tab = Tab.find(params[:tab_id])
    Tab.delete(@tab.id)
    if @org.tab_count.to_i >= 1
      @org.tab_count -= 1
      @org.save
    end
    redirect_to :action =>'myHQpage_admin',:id => @org.id
  end
  
  def addNavTab
    @org = Org.find(params[:id])
    @events = @org.events
    @tabs = @org.tabs
    if params[:tab][:title].length <= 5
      @tab = Tab.new
      if @org.tab_count == 0 or @org.tab_count < 6
        @tab.content = params[:content]
        @tab.title = params[:tab][:title]
        @tab.org_id = @org.id
        @tab.save!
        @org.tab_count+= 1
        @org.save
      end
      redirect_to :action =>'myHQpage_admin',:id => @org.id
    else
      redirect_to :action => 'myHQpage_admin',:id =>@org.id,:flag => 5
    end
  end
  
  def change_calendar
    @org = Org.find(params[:org_id])
    @tabs = @org.tabs
    @events=@org.events
    if @org.update_attributes(params[:org])
      render :partial =>'haml/myHQpage_admin_sales_calendar',:locals => { :f => "#{@org.calendar}",:calender_status=>@org.calender_status}
    end
  end
  
  
  
  def back
    @org = Org.find(params[:org_id])
    @events = @org.events
    render :partial =>'/haml/sales_calendar_example'
  end
  
  def find_templates
    @org=Org.find(params[:id])
    @tab=Tab.find(params[:tab_id])
    if @org  && @tab
      if @tab.content == "bullet"
        redirect_to :controller => 'highlights',:action => 'bulleted_tab', :id =>@org.id,:tab_id=>@tab.id
      elsif @tab.content == "flowing"
        render :partial => 'haml/myHQpage_admin_flowing_text'
      elsif @tab.content == "price"
        redirect_to :controller => 'prices',:action =>'price_description',:id => @org.id,:main_tab=>@tab.id
      end
      
    end
    
  end
  def deal_voteup
    
    @org = Org.find(params[:org_id])
    @deals=@org.deals
    @deal=Deal.find(params[:id])
    if session[:deal_votes].empty?
      @deal.rank = @deal.rank + 1
      session[:deal_votes] =params[:id]
      @deal.save
    else
      session[:deal_votes].each do |vote|
        if vote != params[:id]
          @deal.rank=@deal.rank + 1
          session[:deal_votes] =params[:id]
          @deal.save
        end
      end
    end
    
    render :partial =>'/haml/myHQpage_HQCard_example'
    
  end
  
  def deal_votedown
    
    @org = Org.find(params[:org_id])
    @deals=@org.deals
    @deal=Deal.find(params[:id])
    if session[:deal_votes].empty?
      @deal.rank = @deal.rank - 1
      session[:deal_votes] =params[:id]
      @deal.save
    else
      session[:deal_votes].each do |vote|
        if vote != params[:id]
          @deal.rank=@deal.rank - 1
          session[:deal_votes] =params[:id]
          @deal.save
        end
      end
    end
    render :partial =>'/haml/myHQpage_HQCard_example'
    
  end
  
  def calendar_voteup
    
    @org = Org.find(params[:org_id])
    @events=@org.events
    @event=Event.find(params[:id])
    puts "wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww#{session[:event_votes]}"
    if session[:event_votes].empty?
      @event.rank = @event.rank + 1
      session[:event_votes] =params[:id]
      @event.save
    else
      puts " *********************************Session Else *************************************"
      session[:event_votes].each do  |vote|
        puts " *********************************VOTE ************************************* #{vote}"
        if vote != params[:id]
          @event.rank = @event.rank + 1
          session[:event_votes] =params[:id]
          @event.save
        end
      end
    end
    render :partial =>'/haml/myHQpage_sales_calendar_example'
  end
  
  def calendar_votedown
    @org = Org.find(params[:org_id])
    @events=@org.events
    @event=Event.find(params[:id])
    if session[:event_votes].empty?
      @event.rank = @event.rank - 1
      session[:event_votes] =params[:id]
      @event.save
    else
      session[:event_votes].each do  |vote|
        if vote != params[:id]
          @event.rank = @event.rank - 1
          session[:event_votes] =params[:id]
          @event.save
        end
      end
    end
    render :partial =>'/haml/myHQpage_sales_calendar_example'
  end
  
  def choose_tab
    
    @org=Org.find(params[:org_id])
    @highlights=Highlight.find(:all,:conditions =>["tabid=?",params[:id]])
    @flowing=@org.flowing
    @events=@org.events
    @deals=@org.deals
    @price_tabs=PriceTab.find(:all,:conditions=>["main_tab=?",params[:id]])
    @prices=Price.find(:all,:conditions =>["tab_id=?",params[:id]])
    @tab=Tab.find(params[:id])
    @facts=@org.facts
    if @tab.content == 'bullet'
      render :template => '/haml/myHQpage_bulleted_lists'
    elsif @tab.content == 'flowings'
      render :template => '/haml/myHQpage_flowing_text'
    else
      render :template => '/haml/myHQpage_pricedescription'
    end
  end
  
  
  def list_price_items
    @org=Org.find(params[:org_id])
    
    #@pricetab = PriceTab.find(params[:tab_iid])
    @prices = Price.find(:all,:conditions => [ "tab_id = ?" , params[:id]])
    render :partial =>'haml/myHQpage_price_description_example'
  end
  
  
  def manage_hq_card
    render :partial =>'manage_hq_card'
  end
  
  def manageHQCard
    
    @org=Org.find(params[:id])
    @deal = Deal.new
    @deals= @org.deals
    @events =@org.events
  end
  def create_events
    p '@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@santhosh'
    p params[:org_id]
    @org = Org.find(params[:org_id])
    @facttts = Fact.find_all_by_org_id(params[:id])
    @event = @org.events.build(params[:event])
    @events=@org.events
    @tabs=@org.tabs
    if @event.save
      redirect_to :action => 'myHQpage_admin',:id => @org.id
    end
  end
  
  
  def create_deal
    @org=Org.find(params[:id])
    @deal=@org.deals.build(params[:deal])
    @events=@org.events
    @deals=@org.deals
    @deal.save
    render :template =>'haml/manageHQCard'
  end
  
  def update_deal_image
    
    @org=Org.find(params[:orgid])
    @deals=@org.deals
    @events=@org.events
    @deal=Deal.find(:last)
    @deal.photo=params[:photo]
    
    @deal.save
    render :template =>'haml/manageHQCard'
  end
  
  
  def delete_deal
    @org=Org.find(params[:org_id])
    @deals=@org.deals
    @deal = Deal.find(params[:id])
    @deal.destroy
    render :partial =>'haml/manage_hq_card_example'
    
  end
  
  def vote_up_deal
    @org=Org.find(params[:org_id])
    @deals=@org.deals
    @deal=Deal.find(params[:id])
    if @deal.vote_flag == false
      @deal.rank = @deal.rank + 1
      @deal.vote_flag=true
      @deal.save
    end
    render :partial =>'/haml/manage_hq_card_example'
  end
  
  def vote_down_deal
    @org=Org.find(params[:org_id])
    
    @deals = @org.deals
    @deal=Deal.find(params[:id])
    @deal.rank = @deal.rank - 1
    @deal.save
    render :partial =>'/haml/manage_hq_card_example'
  end
  def hqcard_search_deal_voteup
    @deal=Deal.find(params[:id])
    if session[:deal_votes].empty?
      @deal.rank = @deal.rank + 1
      session[:deal_votes] =params[:id]
      @deal.save
    else
      session[:deal_votes].each do |vote|
        if vote != params[:id]
          @deal.rank=@deal.rank + 1
          session[:deal_votes] =params[:id]
          @deal.save
        end
      end
    end
    render :partial =>'/haml/hq_card_search_vote'
    
  end
  
  def hqcard_search_deal_votedown
    
    @deal=Deal.find(params[:id])
    if session[:deal_votes].empty?
      @deal.rank = @deal.rank - 1
      session[:deal_votes] =params[:id]
      @deal.save
    else
      session[:deal_votes].each do |vote|
        if vote != params[:id]
          @deal.rank=@deal.rank - 1
          session[:deal_votes] =params[:id]
          @deal.save
        end
      end
    end
    render :partial =>'/haml/hq_card_search_vote'
    
  end
end
