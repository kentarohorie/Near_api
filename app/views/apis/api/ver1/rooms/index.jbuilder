json.array! @rooms do |room|
  json.roomID room[:room_id]
  json.opponentUser do |opponentUser|
     json.id room[:opponent_user].id
     json.name room[:opponent_user].name
     json.gender room[:opponent_user].gender
     json.age room[:opponent_user].age
     json.fbID room[:opponent_user].facebook_id
     json.loginTime room[:opponent_user].login_time
     json.work room[:opponent_user].work
     json.school room[:opponent_user].school
     json.greetingMessage room[:opponent_user].greeting
  end
  json.messages do |messagesElement|
    messagesElement.array! room[:messages] do |message|
      json.message message[:message]
      json.isCurrent message[:is_current?]
      json.sentTime message[:sent_time]
    end
  end
end