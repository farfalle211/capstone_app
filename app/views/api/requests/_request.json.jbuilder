json.id request.id
json.confirmed request.confirmed
json.user_event_id request.user_event_id
json.group_id request.group_id

# json.user do
#   json.partial! request.user, partial: 'api/users/user', as: :user
# end

json.user_id request.user.id
json.user_name request.user.name
json.user_age request.user.age
json.user_location request.user.location

