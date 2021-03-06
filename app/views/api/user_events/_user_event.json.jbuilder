json.id user_event.id
json.user_id user_event.user_id
json.event_id user_event.event_id
json.confirmation_status user_event.confirmation_status
json.seating_quality user_event.seating_quality

json.events_attended user_event.user.user_events.attended.count
json.adjusted_interested_total user_event.adjusted_interested_total

json.distance_between user_event.distance_between


json.formatted do
  if user_event.confirmation_status
    json.confirmation_status user_event.friendly_confirmation_status
  end
end

json.formatted_event do
  json.event user_event.event.name
  json.date user_event.event.friendly_date
end

# json.formatted_event_2 do
#   if user_event.confirmation_status == "attended"
#     json.event user_event.event.name
#     json.date user_event.event.friendly_date
#     json.group user_event.event.
#   end
# end

