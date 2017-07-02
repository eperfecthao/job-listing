class Resume < ApplicationRecord
  belongs_to :user
  belongs_to :job

  mount_uploader :attachment, AttachmentUploader

  validates_presence_of :content

  scope :recent, -> {order("created_at DESC")}
end
