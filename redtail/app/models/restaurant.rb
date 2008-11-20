class Restaurant < ActiveRecord::Base
  has_many :reservations
end
