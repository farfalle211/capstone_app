json.id event.id
json.name event.name
json.date event.friendly_date
json.category event.category
json.location event.location


if event.user_event_by_user(current_user)
  json.user_event_by_user do 
      json.partial! event.user_event_by_user(current_user), partial: "api/user_events/user_event", as: :user_event
  end
else
  json.user_event_by_user nil
end

json.groups do
  json.array! event.groups, partial: 'api/groups/group', as: :group
end

