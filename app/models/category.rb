class Category < ActiveRecord::Base
  belongs_to :hackimoto
  has_many :prizes
end