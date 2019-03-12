json.id event.id
json.name event.name
json.date event.date
json.category event.category
json.location event.location

json.groups do
  json.array! event.groups, partial: 'api/groups/group', as: :group
end
