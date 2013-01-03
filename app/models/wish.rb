class Wish < ActiveRecord::Base
  belongs_to :user
  
  attr_accessible :name, :description, :link, :price

  validates_presence_of :name, :price
  validates :price, :numericality => { :greater_than_or_equal_to => 0 }

  def grant!
    update_attribute(:granted, true)
  end

  def granted?
    granted == true
  end
end