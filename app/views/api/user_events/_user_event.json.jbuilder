json.id user_event.id
json.user_id user_event.user_id
json.event_id user_event.event_id
json.confirmation_status user_event.confirmation_status
json.seating_quality user_event.seating_quality


json.formatted do
  if user_event.confirmation_status
    json.confirmation_status user_event.friendly_confirmation_status
  end
end

json.formatted_event do
  json.event user_event.event.name
  json.date user_event.event.friendly_date
end

