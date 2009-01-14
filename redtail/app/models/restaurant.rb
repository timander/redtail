class Restaurant < ActiveRecord::Base
  has_many :reservations
  
  def name_on_date
    "#{name} on #{date}"
  end
  
  def self.find_next
    self.find(:first, :conditions => ["date > ?", Date.today], :order => "date asc") 
  end
  
end
