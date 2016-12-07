class HackUser < ActiveRecord::Base
  belongs_to :user
  belongs_to :hackimoto
  belongs_to :hack
end