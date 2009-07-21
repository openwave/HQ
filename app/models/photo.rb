class Photo < ActiveRecord::Base
  require 'rubygems'
   require 'RMagick'
   include Magick
   require 'aws/s3'

   attr_accessor :x1, :y1, :width, :height
   
  belongs_to :gallery
  acts_as_list

  #validates_presence_of :gallery
  validates_length_of :title, :within => 5..128, :allow_nil => true, :allow_blank => true

  # Paperclip
  #has_attached_file :image,:styles => {:thumb   => "107x60#",:full    => "545x307>" },:storage => :s3,:s3_credentials => "#{RAILS_ROOT}/config/s3.yml",:path => "photos/:attachment/:id/:style.:extension",:bucket => 'hq_project_development_bucket'
  has_attached_file :image
  # using typical SLR camera aspect ratio of 2:3 (I.e. 4" x 6")
  #:styles => { :original => "700x466", :cover => "150x100!", :thumb => "68x50!" },

  validates_attachment_presence :image
  validates_attachment_content_type :image, :content_type => ['image/jpeg', 'image/gif', 'image/png', 'image/pjpeg', 'image/x-png']
  
def update_attributes(att)

  # Should we crop?
  scaled_img = Magick::ImageList.new(self.image.path)
 # scaled_img = Magick::ImageList.new(self.image.path)
  orig_img = Magick::ImageList.new(self.image.path(:original))

  #orig_img = Magick::ImageList.new(self.image.path(:original))
  scale = orig_img.columns.to_f / scaled_img.columns

  args = [ att[:x1], att[:y1], att[:width], att[:height] ]
 args = args.collect { |a| a.to_i * scale }

 orig_img.crop!(*args)
  puts "********************************************* PATH -URL********************************** #{self.image.url}"
  puts "********************************************* PATH -PATH ********************************** #{self.image.path}"
  orig_img.write(self.image.path)
   #orig_img.write(self.image.url)
 # self.image.reprocess!
  self.save

  super(att)
end

end