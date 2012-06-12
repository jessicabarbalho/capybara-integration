class User < ActiveRecord::Base
  authenticates_with_sorcery!
  attr_accessible :email, :password, :name, :hometown

  validates_presence_of :password, :on => :create
  validates :password, :length => { :minimum => 4 }
  validates_presence_of :email
  validates_uniqueness_of :email
  validates :email, :format => {:with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i }
end
