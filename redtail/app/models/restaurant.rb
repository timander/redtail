class Restaurant < ActiveRecord::Base
  has_many :reservations
  
  def name_on_date
    "#{name} on #{date}"
  end
  
  def self.find_next
    self.find(:first, :conditions => ["date > ?", Date.today], :order => "date asc") 
  end

  # Produces -> Thursday May 25, 2006
  def date_formatted
    date.strftime("%A %B %d, %Y")
  end
end
