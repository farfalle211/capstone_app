json.id group.id
json.size group.size
json.event_id group.event_id
json.seating_quality group.event_id
json.open group.open
json.label group.label
json.meet_before group.meet_before
json.drink_level group.drink_level
json.gender_preference group.gender_preference
json.creater_id group.creater_id

json.requested group.requested?(current_user)

json.requests do
  json.array! group.requests, partial: 'api/requests/request', as: :request
end

json.formatted do
  json.meet_before group.friendly_meet_before
  json.drink_level group.friendly_drink_level
  json.gender_preference group.gender_preference
  json.event_date group.event.friendly_date
  json.event_name group.event.name
end
