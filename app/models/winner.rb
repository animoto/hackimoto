class Winner < ActiveRecord::Base
  belongs_to :hackimoto
  belongs_to :prize
  belongs_to :hack
end
