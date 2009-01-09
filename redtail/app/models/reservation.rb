class Reservation < ActiveRecord::Base
  belongs_to :user
  belongs_to :restaurant
  
  validates_presence_of :lunch_period, :on => :create, :message => "can't be blank"
  validates_presence_of :take_out, :on => :create, :message => "can't be blank"
  validates_presence_of :restaurant, :on => :create, :message => "can't be blank"
  validates_presence_of :user, :on => :create, :message => "can't be blank"

end
