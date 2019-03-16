class Request < ApplicationRecord
  validates :user_event_id, uniqueness: { scope: :group_id,
      message: "should not have multiple user requests per group"}

   belongs_to :group
   belongs_to :user_event
   has_one :user, through: :user_event
   

   enum confirmed: {pending: 0, confirmed: 1}

end
