class Event < ActiveRecord::Base
  belongs_to :org
  acts_as_geocodable

  
 has_attached_file :image,:styles => {:thumb   => "107x60#",:full    => "545x307>" },:storage => :s3,:s3_credentials => "#{RAILS_ROOT}/config/s3.yml", :path => "events-images/:attachment/:id/:style.:extension",  :bucket => 'hq_project_development_bucket' 
  AGE_TYPES = [[ "18+", "18+" ],
    [ "21+", "21+" ],
    [ "None", "None" ]]

end
