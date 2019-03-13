class Event < ApplicationRecord
  has_many :groups
  has_many :user_events
  has_many :users, through: :user_events


  def friendly_date
      if date
        self.date.strftime("%a, %B %e, %Y")
      end
  end

end
