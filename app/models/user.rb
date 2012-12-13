class User < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :email 

  validates_presence_of :first_name, :last_name, :email
  validates_uniqueness_of :email

  def name
    first_name + " " + last_name
  end
end
