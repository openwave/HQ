class Review < ActiveRecord::Base
  belongs_to :org
  has_many :review_reports
end