json.id user.id
json.name user.name
json.email user.email
json.age user.age
json.gender user.gender
json.summary user.summary
json.location user.location

json.events do
  json.array! user.events, partial: 'api/events/event', as: :event
end

# json.event do
#   json.partial! user.event, partial: 'api/events/event', as: :event
# end   #this is how you would write a belongs to association. 

json.groups do
  json.array! user.groups, partial: 'api/groups/group', as: :group
end