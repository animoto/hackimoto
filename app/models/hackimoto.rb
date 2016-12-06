class Hackimoto < ActiveRecord::Base
  has_many :categories
  has_many :hackimoto_admin_users
  has_many :hacks
  has_many :admin_users, :through => :hackimoto_admin_users, :source => :user
  has_many :judges

  scope :active, lambda { last }

end