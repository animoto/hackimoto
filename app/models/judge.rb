class Judge < ActiveRecord::Base
  belongs_to :hackimoto
  belongs_to :user
end