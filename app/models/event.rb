class Event < ApplicationRecord
  has_many :groups, dependent: :destroy
  has_many :user_events, dependent: :destroy
  has_many :users, through: :user_events

  validates :date, presence: true


  def friendly_date
      if date
        self.date.strftime("%a, %B %e, %Y")
      end
  end

  def user_event_by_user(current_user)
    self.user_events.find_by(user_id: current_user.id)
  end
    # !!(self.user_events.find_by(user_id: current_user.id))

end

# def user_event_by_user(current_user)
#   self.user_events.find_by(user_id: current_user.id)
# end

# json.user_event_by_user do 
#   json.partial! event.user_event_by_user(current_user), partial: "api/user_events/user_event", as: :user_event
# end

