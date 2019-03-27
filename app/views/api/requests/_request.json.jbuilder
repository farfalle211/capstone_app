json.id request.id
json.confirmed request.confirmed
json.user_event_id request.user_event_id
json.group_id request.group_id

json.user do 
  json.id request.user.id
  json.name request.user.name
  json.age request.user.age
  json.location request.user.location
  json.phone_number request.user.phone_number
end