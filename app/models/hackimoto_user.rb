class HackimotoUser < ActiveRecord::Base
  belongs_to :user
  belongs_to :hackimoto
end
