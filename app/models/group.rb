class Group < ApplicationRecord

  belongs_to :creater, class_name: "User"
  belongs_to :event

  has_many :requests

  has_many :user_events, through: :requests
  has_many :users, through: :user_events


end

#creeater defines the foreign key were looking for. 