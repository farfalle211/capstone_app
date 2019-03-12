class Group < ApplicationRecord

  belongs_to :creater, class_name: "User"
  belongs_to :event

  has_many :requests

  has_many :user_events, through: :requests
  has_many :users, through: :user_events

  enum meet_before: {dinner: 1, drinks: 2, :dinner_and_drinks => 3}
  enum drink_level: {sober: 1, one_to_two: 2, three_or_more: 3}
  enum gender_preference: {male: 1, female: 2}

end

#creeater defines the foreign key were looking for. 