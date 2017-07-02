class Job < ApplicationRecord

  has_many :resumes

  validates_presence_of :title
  validates :wage_lower_bound, presence: true
  validates :wage_lower_bound, numericality: { greater_than: 0}
  validates_presence_of :wage_upper_bound

  scope :recent, -> {order("created_at DESC")}
  scope :publish_status!, -> { where(:is_hidden => false)}

  def publish!
    self.is_hidden = false
    self.save
  end

  def hide!
    self.is_hidden = true
    self.save
  end
end
