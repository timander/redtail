#relationship between selections and restaurants

class Choice < ActiveRecord::Base
  belongs_to :restaurant
  has_one :selection
end
