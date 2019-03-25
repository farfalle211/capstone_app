class Group < ApplicationRecord

  belongs_to :creater, class_name: "User"
  belongs_to :event

  has_many :requests, dependent: :destroy

  has_many :user_events, through: :requests
  has_many :users, through: :user_events

  enum meet_before: {dinner: 1, drinks: 2, :dinner_and_drinks => 3}
  enum drink_level: {sober: 1, one_to_two: 2, three_or_more: 3}
  enum gender_preference: {male: 1, female: 2, no_preference: 3}


  validates :size, presence: true
  validates :label, uniqueness: true
  validates :meet_before, presence: true
  validates :drink_level, presence: true
  validates :creater_id, uniqueness: {scope: :event_id,
    message: "is only allowed to create one group per event"}

  def friendly_meet_before
    self.meet_before.gsub("_", " ").titleize
  end

  def friendly_drink_level
    self.drink_level.gsub("_", " ").titleize
  end

  def friendly_gender_preference
    self.gender_preference.gsub("_", " ")
  end

  def requested?(current_user)
    user_event_obj = current_user.user_events.find_by(event_id: self.event_id)

    if user_event_obj
      request = Request.find_by(user_event_id: user_event_obj.id, group_id: self.id)
      request
    else
      false
    end
  end

  def find_current_user(current_user)
    current_user
  end


  def open?
    # requests.confirmed.count < size || open
   
    confirmed_count = 0
    all_requests = self.requests

    all_requests.each do |request|
      if request.confirmed == "confirmed"
        confirmed_count += 1
      else
      end
    end
    number_of_members = confirmed_count + 1

    if number_of_members >= self.size
      self.open = false
    else
      self.open = true
    end
  end

  def friendly_group_size
    
    confirmed_count = 0
    all_requests = self.requests
    all_requests.each do |request|
      if request.confirmed == "confirmed"
        confirmed_count += 1
      else
      end
    end
    number_of_members = confirmed_count + 1

    "#{number_of_members}/#{self.size}"
  end

end

#creeater defines the foreign key were looking for. 