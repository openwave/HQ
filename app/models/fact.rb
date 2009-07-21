class Fact < ActiveRecord::Base
  belongs_to :org
  validates_presence_of :title
  validates_presence_of :content
  acts_as_textiled :body
  FACT_TYPES = [[ "Hours", "Hours" ],
   [ "Serving", "Serving" ],
   [ "Insurance", "Insurance" ],
   [ "Price", "Price" ],
   [ "Address", "Address" ],
   [ "Features", "Features" ],
   [ "Custom", "Custom" ]]

end
