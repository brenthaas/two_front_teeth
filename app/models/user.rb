class User < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :email 

  validates :first_name, :presence => {:message => "can't be blank"}
  validates :last_name, :presence => {:message => "can't be blank"}

  def name
  	first_name + " " + last_name
  end
end
