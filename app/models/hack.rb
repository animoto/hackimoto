class Hack < ActiveRecord::Base
  has_many :hack_users
  has_many :users, :through => :hack_users
  belongs_to :hackimoto
end