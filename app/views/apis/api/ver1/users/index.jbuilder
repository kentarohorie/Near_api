json.array! @users_distances do |hash|
  json.id hash[:user].id
  json.name hash[:user].name
  json.gender hash[:user].gender
  json.age hash[:user].age
  json.fbID hash[:user].facebook_id
  json.distance hash[:distance]
end