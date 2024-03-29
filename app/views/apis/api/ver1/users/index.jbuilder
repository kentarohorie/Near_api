json.array! @users_distances do |hash|
  json.id hash[:user].id
  json.name hash[:user].name
  json.gender hash[:user].gender
  json.age hash[:user].age
  json.fbID hash[:user].facebook_id
  json.loginTime hash[:user].login_time
  json.distance hash[:distance]
  json.work hash[:user].work
  json.school hash[:user].school
  json.greetingMessage hash[:user].greeting
end
