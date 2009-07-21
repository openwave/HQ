class Flowing < ActiveRecord::Base
  validates_presence_of :title, :message => "can't be blank"
  validates_presence_of :content, :message => "can't be blank"
  acts_as_textiled :content
  belongs_to :org
end