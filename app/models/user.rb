class User < ActiveRecord::Base
  has_many :messages
  # has_many :user_rooms
  # has_many :rooms, through: :user_rooms

  require 'json'
  require 'open-uri'
  DISTANCE_API = "http://vldb.gsi.go.jp/sokuchi/surveycalc/surveycalc/bl2st_calc.pl?"

  def self.isRegisterBefore(id)
    User.where(facebook_id: id).present?
  end

  def self.distance_with_api(lat1, lng1, lat2, lng2)
    req_params = {
      outputType: "json",
      ellipsoid: "bessel",
      latitude1: lat1,
      longitude1: lng1,
      latitude2: lat2,
      longitude2: lng2
    }
    req_params = req_params.map { |k, v| "#{k}=#{v}" }.join("&")
    result = JSON.parse(open(DISTANCE_API + req_params).read)
    result["OutputData"]["geoLength"]
  end # 3857.347

  def self.get_distance(lat1, lng1, lat2, lng2)
    y1 = lat1.to_f * Math::PI / 180
    x1 = lng1.to_f * Math::PI / 180
    y2 = lat2.to_f * Math::PI / 180
    x2 = lng2.to_f * Math::PI / 180
    earth_r = 6378140

    deg = Math::sin(y1) * Math::sin(y2) + Math::cos(y1) * Math::cos(y2) * Math::cos(x2 - x1)
    distance = earth_r * (Math::atan(-deg / Math::sqrt(-deg * deg + 1)) + Math::PI / 2) / 1000
    distance = sprintf("%.3f", distance)
    distance = distance.match(/\h/)[0] + distance.match(/\d\d\d/)[0]
    return distance.to_i
  end # 3870.456 APIを使うより、圧倒的速度。10000回計算しても0.1, 2秒くらい

  def self.get_distance_users(current_user, users)
    user_distance_hash = {}
    for user in users
      user_distance_hash["#{user.id}"] = get_distance(current_user.latitude, current_user.longitude, user.latitude, user.longitude)
    end
    user_distance_hash.sort {|(k1, v1), (k2, v2)| v1 <=> v2 }.map { |key, v| { user: User.find(key.to_i), distance: v } }
  end

end
