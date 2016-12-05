class HackimotoAdminUser < ActiveRecord::Base
  belongs_to :hackimoto
  belongs_to :user

  validates_presence_of :hackimoto, :user
end