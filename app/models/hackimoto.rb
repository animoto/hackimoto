class Hackimoto < ActiveRecord::Base
  has_many :categories
  has_many :hackimoto_admin_users
  has_many :admin_users, :through => :hackimoto_admin_users, :source => :user
end