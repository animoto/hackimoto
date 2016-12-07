class Hackimoto < ActiveRecord::Base
  has_many :categories
  has_many :hackimoto_admin_users
  has_many :hacks
  has_many :admin_users, :through => :hackimoto_admin_users, :source => :user
  has_many :judges
  has_many :judge_users, :through => :judges, :source => :user
  has_many :hack_users
  has_many :hackers, :through => :hack_users, :source => :user

  scope :active, lambda { order(:start_date).last }
end