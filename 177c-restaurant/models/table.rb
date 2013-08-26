class Table < ActiveRecord::Base
  has_many :orders
  validates :total_chairs, presence: true
end
