class Highlight < ActiveRecord::Base
  belongs_to :org
  acts_as_list
end
