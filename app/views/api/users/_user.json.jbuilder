json.id user.id
json.name user.name
json.email user.email
json.age user.age
json.gender user.gender
json.summary user.summary
json.location user.location
json.phone_number user.phone_number
json.latitude user.latitude
json.longitude user.longitude
json.image user.image
# json.image_url rails_blob_url(user.image) if user.image.attachment


# json.events do
#   json.array! user.events, partial: 'api/events/event', as: :event
# end

json.user_events do 
  json.array! user.user_events, partial: 'api/user_events/user_event', as: :user_event
end

# json.event do
#   json.partial! user.event, partial: 'api/events/event', as: :event
# end   #this is how you would write a belongs to association. 

json.groups do
  json.array! user.groups, partial: 'api/groups/group', as: :group
end


json.created_groups do
  json.array! user.created_groups, partial: 'api/groups/group', as: :group
end
