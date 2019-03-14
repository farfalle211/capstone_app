class Event < ApplicationRecord
  has_many :groups
  has_many :user_events
  has_many :users, through: :user_events


  def friendly_date
      if date
        self.date.strftime("%a, %B %e, %Y")
      end
  end

  def check_user_event
    "anything"
    # true if self.user_events.where(user_id: current_user.id)
      
      # current_user.id == event.user_event

      # current user thats logged ins user_events
      # # display user_event.id (on the front end)
      # current_user.user_events
      # #can user_events be called on current_user. What methods besides id can?
  end

end
