class Price < ActiveRecord::Base
  belongs_to :org
  acts_as_list 

has_attached_file :photo,:styles => {:thumb   => "107x60#",:full    => "545x307>" },:storage => :s3,:s3_credentials => "#{RAILS_ROOT}/config/s3.yml", :path => "price-images/:attachment/:id/:style.:extension",  :bucket => 'hq_project_development_bucket'
validates_presence_of :item
validates_uniqueness_of :item
end
