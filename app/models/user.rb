class User < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :email 

  validates :first_name, :presence => {:message => "First name can't be blank"}
  validates :last_name, :presence => {:message => "Last name can't be blank"}

  def name
  	first_name + " " + last_name
  end
end
