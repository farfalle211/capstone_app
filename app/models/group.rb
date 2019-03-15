class Group < ApplicationRecord

  belongs_to :creater, class_name: "User"
  belongs_to :event

  has_many :requests

  has_many :user_events, through: :requests
  has_many :users, through: :user_events

  enum meet_before: {dinner: 1, drinks: 2, :dinner_and_drinks => 3}
  enum drink_level: {sober: 1, one_to_two: 2, three_or_more: 3}
  enum gender_preference: {male: 1, female: 2, no_preference: 3}

  def friendly_meet_before
    self.meet_before.gsub("_", " ").titleize
  end

  def friendly_drink_level
    self.drink_level.gsub("_", " ")
  end

  def friendly_gender_preference
    self.gender_preference.gsub("_", " ")
  end

  def requested?(current_user)
    user_event_obj = current_user.user_events.find_by(event_id: self.event_id)

    if user_event_obj
      request = Request.find_by(user_event_id: user_event_obj.id, group_id: self.id)
      !!(request)
    else
      false
    end
  end

end

#creeater defines the foreign key were looking for. 