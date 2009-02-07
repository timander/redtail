#relationship between selections and restaurants

class Choice < ActiveRecord::Base
  belongs_to :restaurant
  belongs_to :selection
end
