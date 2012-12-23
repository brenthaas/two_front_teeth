class Wish < ActiveRecord::Base
  belongs_to :user
  
  attr_accessible :name, :description, :link, :price

  def grant!
    update_attribute(:granted, true)
  end

  def granted?
    granted == true
  end
end