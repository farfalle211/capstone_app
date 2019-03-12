json.id user.id
json.name user.name
json.email user.email
json.password user.password
json.password_confirmation user.password_confirmation
json.age user.age
json.gender user.gender
json.summary user.summary
json.location user.location

json.events do
  json.array! user.events, partial: 'api/events/event', as: :event
end

json.groups do
  json.array! user.groups, partial: 'api/groups/group', as: :group
end

json.user_events do
  json.array! user.user_events, partial: 'api/user_events/user_event', as: :user_event
end
