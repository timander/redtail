class Option < ActiveRecord::Base
  belongs_to :selection
  belongs_to :decision
end
