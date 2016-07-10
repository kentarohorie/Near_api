class Room < ActiveRecord::Base
  has_many :messages
  # has_many :user_rooms
  # has_many :users, through: :user_rooms

  def self.isExistRoom(sender_id, opponent_id)
    Room.where(send_user_id: sender_id, opponent_user_id: opponent_id).present?
  end

  def self.convert_hash_from_rooms(rooms, send_user_id)
    converted_hash_array = []
    rooms.each do |room|
      messages = room.get_message(send_user_id)
      room_id = room.id
      opponent_user = User.where(facebook_id: room.opponent_user_id)[0]
      hash = { room_id: room_id, opponent_user: opponent_user, messages: messages }
      converted_hash_array << hash
    end
    return converted_hash_array
  end

  def is_current_user?(user_id, message)
    user_id == message.user_id
  end

  def get_message(send_user_id)
    messages = Message.where(room_id: self.id)
    messages_hash_array = []
    messages.each do |message|
      hash = { message: message.message, is_current?: is_current_user?(send_user_id, message) }
      messages_hash_array << hash
    end
    return messages_hash_array
  end

end
