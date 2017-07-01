class Job < ApplicationRecord
  validates_presence_of :title

  scope :recent, -> {order("created_at DESC")}
end
