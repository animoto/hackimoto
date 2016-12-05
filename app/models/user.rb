class User < ActiveRecord::Base
  has_many :hack_users
  has_many :hacks, :through => :hack_users
end