class Restaurant < ActiveRecord::Base
  has_many :reservations
  has_many :choices
  has_many :selections, :through => :choices

  validates_presence_of :name, :on => :create, :message => "can't be blank"
  validates_presence_of :date, :on => :create, :message => "can't be blank"
  validates_presence_of :price, :on => :create, :message => "can't be blank"
  validates_presence_of :description, :on => :create, :message => "can't be blank"
  
  def name_on_date
    "#{name} on #{date}"
  end
  
  def required_selection_ids=(required_selections)
    choices << required_selections.map do |selection_id|
      Choice.new(:selection_id => selection_id, :required => true)
    end
  end
  
  def required_to_go_selection_ids=(required_selections)
    choices << required_selections.map do |selection_id|
      Choice.new(:selection_id => selection_id, :required_to_go => true)
    end
  end
  
  def self.find_next
    self.find(:first, :conditions => ["date > ?", Date.today], :order => "date asc") 
  end

  # Produces -> Thursday May 25, 2006
  def date_formatted
    date.strftime("%A %B %d, %Y")
  end
    
end
