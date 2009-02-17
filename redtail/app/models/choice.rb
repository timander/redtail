#relationship between selections and restaurants

class Choice < ActiveRecord::Base
  belongs_to :restaurant
  belongs_to :selection
  
  validates_presence_of :selection, :on => :create, :message => "can't be blank"
  
  def label
    selection.name
  end
  
  def options
    selection.options
  end
  
end
