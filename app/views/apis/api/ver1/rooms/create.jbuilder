json.roomID @room.id
json.messages do |messagesElement|
  messagesElement.array! @messages do |hash|
    json.message hash[:message]
    json.isCurrent hash[:is_current?]
  end
end
