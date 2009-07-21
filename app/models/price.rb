class Price < ActiveRecord::Base
  belongs_to :org
  acts_as_list 
has_attached_file :photo 
validates_presence_of :item
validates_uniqueness_of :item
end
