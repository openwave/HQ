class Tab < ActiveRecord::Base
  acts_as_list
  belongs_to :org
  validates_length_of :title, :within => 1..20, :allow_nil => false, :allow_blank => false ,:message =>"is invalid"
  def validate

  end
end
