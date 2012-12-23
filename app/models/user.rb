class User < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :email 

  validates_presence_of :first_name, :last_name, :email
  validates_uniqueness_of :email
  validates_email_format_of :email

  has_many :wishes

  def name
    first_name + " " + last_name
  end
end
