#relationship between reservations and options

class Decision < ActiveRecord::Base
  belongs_to :reservation
  has_one :selection
  has_one :option
end
