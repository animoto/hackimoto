class Prize < ActiveRecord::Base
  belongs_to :category
  has_one :winner

  validates_presence_of :amount, :rank
end