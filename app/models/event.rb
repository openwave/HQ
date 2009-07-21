class Event < ActiveRecord::Base
  belongs_to :org
  acts_as_geocodable

  has_attached_file :image
  
  AGE_TYPES = [[ "18+", "18+" ],
    [ "21+", "21+" ],
    [ "None", "None" ]]

end
