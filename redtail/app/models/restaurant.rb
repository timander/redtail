class Restaurant < ActiveRecord::Base
  has_many :reservations
  
  def name_on_date
    "#{name} on #{date}"
  end
end
