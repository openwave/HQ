class Gallery < ActiveRecord::Base
   belongs_to :org
   has_many :photos
 
end
