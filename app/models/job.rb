class Job < ApplicationRecord
  validates_presence_of :title
  validates :wage_lower_bound, presence: true
  validates :wage_lower_bound, numericality: { greater_than: 0}
  validates_presence_of :wage_upper_bound

  scope :recent, -> {order("created_at DESC")}
end
