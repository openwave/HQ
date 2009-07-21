class Org < ActiveRecord::Base
   require 'rubygems'
   require 'RMagick'
   include Magick
   require 'aws/s3'

   attr_accessor :x1, :y1, :width, :height

  belongs_to :user
  acts_as_geocodable
  acts_as_rated
  has_many :flowings
  has_many :facts
  has_many :prices
  has_many :tabs
  has_many :highlights
  has_many :galleries
  has_many :deals
  has_many :events
  has_many :notifications
  has_many :contacts
  has_many :videos
  has_one  :profile
  has_many :video_requests
  has_many :reviews
has_many :price_tabs
  
  # Paperclip
  has_attached_file :image,:styles => {:thumb => "107x60",:full => "545x307"}
  has_attached_file :image,:styles => {:thumb   => "107x60#",:full    => "545x307>" },:storage => :s3,:s3_credentials => "#{RAILS_ROOT}/config/s3.yml", :path => "orgs/:attachment/:id/:style.:extension",  :bucket => 'hq_project_development_bucket'
  validates_attachment_content_type :image, :content_type => ['image/jpeg', 'image/gif', 'image/png', 'image/pjpeg', 'image/x-png']
#   validates_attachment_size :image, :greater_than => 4.kilobytes, :message => "minimum size is 4kB"
  # using typical SLR camera aspect ratio of 2:3 (I.e. 4" x 6")
  #:styles => { :original => "700x466", :cover => "150x100!", :thumb => "68x50!" },
  
  
  STATES = [[ "New Jersey", "NJ" ]]

  CALENDAR_TYPES = [[ "Sales Calendar", "Sales Calendar" ],
    [ "Event Calendar", "Event Calendar" ],
    [ "Open House Calendar", "Open House Calendar" ],[ "Nightlife Calendar", " Nightlife Calendar" ]]
  
  define_index do
    indexes title, :sortable => true
    indexes id, :sortable => true
    indexes postal_code, :sortable => true
    indexes video_count, :sortable => true
    indexes locality, region, postal_code, country, :facet => true    
    indexes flowings.content, :as => :flowings_contents
    has geocoding.geocode(:id), :as => :geocode_id,:sortable => true
    has 'RADIANS(geocodes.latitude)', :as => :latitude, :type => :float,:sortable => true
    has 'RADIANS(geocodes.longitude)', :as => :longitude, :type => :float,:sortable => true
    has postal_code,:as => :postal_code_sort,:sortable => true
    has video_count,:as => :video_count_sort,:sortable => true
    set_property :delta => true
    
  end

 def update_attributes(att)

  # Should we crop?
  if !att[:x1].nil?
  scaled_img = Magick::ImageList.new(self.image.url)
 # scaled_img = Magick::ImageList.new(self.image.path)
  orig_img = Magick::ImageList.new(self.image.url(:original))

  #orig_img = Magick::ImageList.new(self.image.path(:original))
  scale = orig_img.columns.to_f / scaled_img.columns

  args = [ att[:x1], att[:y1], att[:width], att[:height] ]
 args = args.collect { |a| a.to_i * scale }

 orig_img.crop!(*args)
  puts "********************************************* PATH -URL********************************** #{self.image.url}"
  puts "********************************************* PATH -PATH ********************************** #{self.image.path}"
   puts "********************************************* PATH -PATH ********************************** #{orig_img}"
  orig_img.write("./public/original.jpg")
  #orig_img.write(self.image.path)
 # self.image.reprocess!
  self.save
  end
  super(att)
end

def upload_to_s3
   #has_attached_file :image,:styles => {:thumb   => "107x60#",:full    => "545x307>" },:storage => :s3,:s3_credentials => "#{RAILS_ROOT}/config/s3.yml", :path => "orgs/:attachment/:id/:style.:extension",  :bucket => 'hq_project_development_bucket'
    puts "************************************************* UPLOAD_TO_S3 called *******************************"
   AWS::S3::Base.establish_connection!(:access_key_id => '1MEBBKABEPBMZ4GZCSR2',:secret_access_key => 'oTw5OjSKjiYpLbKZSjFVrtP7nbnbWdQq714t4ybS')
   puts "************************************************* AFTER AWS::S3 called *******************************"
  AWS::S3::S3Object.store('original.jpg',open('./public/original.jpg'),'hq_project_development_bucket/orgs/images/' + self.id.to_s + '/', :access => :public_read)
    puts "************************************************* AFTER S3::store called *******************************"
end


  
end
