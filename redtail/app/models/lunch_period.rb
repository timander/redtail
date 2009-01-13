class LunchPeriod < ActiveRecord::Base

  def to_s
    "#{name} [#{begin_end_times}]" 
  end
  
end
