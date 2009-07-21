class PriceTab < ActiveRecord::Base
  belongs_to :org
  has_many :prices

end
