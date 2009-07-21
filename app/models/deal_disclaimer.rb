class DealDisclaimer < ActiveRecord::Base
  belongs_to :deal
  belongs_to :disclaimer
end