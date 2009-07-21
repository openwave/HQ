class Disclaimer < ActiveRecord::Base
  has_many :deal_disclaimers
  has_many :deals, :through => :deal_disclaimers
end