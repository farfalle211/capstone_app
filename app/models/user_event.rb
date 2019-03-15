class UserEvent < ApplicationRecord
  validates :user_id, uniqueness: { scope: :event_id,
      message: "should not be able to indicate interest more than once on an event"}

  belongs_to :user
  belongs_to :event

  has_many :requests
  has_many :groups, through: :requests

  enum confirmation_status: {not_purchased: 1, purchased: 2}

  def friendly_confirmation_status
    self.confirmation_status.gsub("_", " ").titleize
  end

end


