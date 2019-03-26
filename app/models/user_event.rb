class UserEvent < ApplicationRecord
  validates :user_id, uniqueness: { scope: :event_id,
      message: "should not be able to indicate interest more than once on an event"}

  belongs_to :user
  belongs_to :event

  has_many :requests
  has_many :groups, through: :requests

  enum confirmation_status: {not_purchased: 1, purchased: 2, attended: 3}

  def friendly_confirmation_status
    self.confirmation_status.gsub("_", " ").titleize
  end

  def adjusted_interested_total
    (user.user_events.count - user.user_events.attended.count)
  end

  def distance_between
    eLat = event.latitude
    eLon = event.longitude

    uLat = user.latitude
    uLon = user.longitude

    p uLat
    p uLon

    p eLat
    p eLon

    Geocoder::Calculations.distance_between([uLat, uLon], [eLat, eLon]) < 40
  end

end


