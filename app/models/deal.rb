class Deal < ActiveRecord::Base
  acts_as_list
  belongs_to :org
  has_many :deal_disclaimers
  has_many :disclaimers, :through => :deal_disclaimers
  validates_length_of :title, :maximum => 20
  validates_length_of :description, :maximum => 150
  validate :too_many_disclaimers

  # Paperclip
  has_attached_file :photo,
  :styles => {
    :thumb   => "100x100#",
    :small   => "100x100>",
    :medium  => "300x300>",
    :large   =>   "400x400>" },
    :storage => :s3,
    :s3_credentials => "#{RAILS_ROOT}/config/s3.yml",
    :path => "deals/:attachment/:id/:style.:extension",
    :bucket => 'mpazaryna_development_bucket'

  validates_attachment_size :photo, :less_than => 0.5.megabytes

  def disclaimers_text
    descriptions = []
    if disclaimers.size > 8
      descriptions << "#{disclaimers.size} Disclaimers"
    else
      descriptions += disclaimers.map(&:name)
    end
    descriptions.join('<br> ')
  end

  def disclaimers_text_flat
    descriptions = []
    if disclaimers.size > 8
      descriptions << "#{disclaimers.size} Disclaimers"
    else
      descriptions += disclaimers.map(&:name)
    end
    descriptions.join(', ')
  end
  
  define_index do    
    indexes title, :sortable => true
    indexes rank, :sortable => true
    indexes updated_at, :sortable => true
    has rank,:as => :rank_sort,:sortable => true
    has updated_at,:as => :updated_at_sort,:sortable => true
    set_property :delta => true
  end

  private

  def too_many_disclaimers
    if disclaimers.size > 3
      errors.add_to_base "Can't have more than 3 disclaimers on your deal."
    end
  end

end
