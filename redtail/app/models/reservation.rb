class Reservation < ActiveRecord::Base
  belongs_to :user
  belongs_to :restaurant
  belongs_to :lunch_period
  
  validates_presence_of :user, :on => :create, :message => "can't be blank"
  validates_presence_of :restaurant, :on => :create, :message => "can't be blank"
  validates_presence_of :lunch_period, :on => :create, :message => "can't be blank"
  validates_presence_of :take_out, :on => :create, :message => "can't be blank"


  def validate_on_create
    if lunch_period
      if ("yes" == take_out)
        errors.add(:lunch_period, "take out is not available for #{lunch_period.name} lunch.") unless lunch_period.to_go_available
      end
      if ("no" == take_out)
        errors.add(:lunch_period, "only option for #{lunch_period.name} lunch is take out.") unless lunch_period.eat_in_available
      end
    end
  end

end
