class User < ApplicationRecord
  has_secure_password

  # has_one_attached :image
  
  has_many :images
  has_many :user_events
  has_many :events, through: :user_events

  has_many :requests, through: :user_events
  has_many :groups, through: :requests
  
  has_many :created_groups, class_name: "Group", foreign_key: "creater_id"

  enum gender: {male: 1, female: 2}

  validates :email, presence: true, uniqueness: true

end


#type the name of the class of the model that youre looking for. 