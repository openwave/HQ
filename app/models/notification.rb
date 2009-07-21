class Notification < ActiveRecord::Base
  belongs_to :org
  belongs_to :user
end
