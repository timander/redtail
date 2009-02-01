class Selection < ActiveRecord::Base
  belongs_to :decision
  has_many :options
end
