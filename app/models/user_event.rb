class UserEvent < ApplicationRecord
  belongs_to :user
  belongs_to :event

  has_many :requests
  has_many :groups, through: :requests

  enum confirmation_status: {not_purchased: 1, purchased: 2}
end
