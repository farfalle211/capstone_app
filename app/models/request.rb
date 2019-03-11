class Request < ApplicationRecord
   belongs_to :group
   belongs_to :user_event
   has_one :user, through: :user_event
   
end
