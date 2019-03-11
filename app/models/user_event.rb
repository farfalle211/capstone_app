class UserEvent < ApplicationRecord
  belongs_to :user
  belongs_to :event

  has_many :requests
  has_many :groups, through: :requests
end
