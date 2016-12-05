class Prize < ActiveRecord::Base
  belongs_to :category

  validates_presence_of :amount, :rank
end