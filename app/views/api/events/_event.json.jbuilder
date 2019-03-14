json.id event.id
json.name event.name
json.date event.friendly_date
json.category event.category
json.location event.location

json.check_user_event event.check_user_event

json.groups do
  json.array! event.groups, partial: 'api/groups/group', as: :group
end

json.user_events do
  json.array! event.user_events, partial: 'api/user_events/user_event', as: :user_event
end

