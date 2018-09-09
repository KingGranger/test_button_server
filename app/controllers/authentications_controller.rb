class AuthenticationsController < ApplicationController
  require 'securerandom'
  require 'date'

  def index
    @Authentications = Authentication.all
    render json: @Authentications
  end

  def create
    @user = User.find_by(email: params[:email])
    @events = Event.joins(:arena, :event_type).where(arena_id: 1).uniq
    if @user && @user.authenticate(params[:password])
      @authentication = Authentication.find_by(user: @user)
      date = DateTime.now
      session_id = SecureRandom.uuid
      @authentication.update({session_id: session_id, last_request_datetime: date})
      @events = id_to_hash(@events)
      render json: {email: @user.email, userID: @user.id, firstName: @user.first_name, lastName: @user.last_name, last_request_datetime: @authentication.last_request_datetime, sessionID: @authentication.session_id, events: @events}
    else
      render({json: {error: 'User is invalid'}, status: 401})
    end
  end

  def id_to_hash events
    events.map do |event|
      p event.arena_id
      ans = event.attributes
      ans[:arena] = Arena.where(id: event.arena_id).attributes
      ans[:eventType] = EventType.where(id: event.event_type_id).attributes
      p ans
      ans
    end
  end


  #securerandom generates the uuid key to save for the session
  #each session is 20 mins long set it to reset every 20 mins
end

#
# {
# 	"userID": "12345",
#   "sessionid":
# 	"firstName": "Joe",
# 	"lastName": "Player",
# 	"email": "joe@player.com",
# 	"events": [{
# 			"eventID": "45678",
# 			"description": "NY Nets vs Cleveland Cavaliers",
# 			"eventDateTime": 1536425966,
# 			"eventImage": "image data",
# 			"eventType:": {
# 				"description": "Basketball Game"
# 			},
# 			"arena": {
# 				"arena_name": "Madison Square Garden",
# 				"city": "New York",
# 				"state": "New York"
# 			}
# 		},
# 		{
# 			"eventID": "54321",
# 			"description": "NY Knicks vs LA Lakers",
# 			"eventDateTime": 1536425966,
# 			"eventImage": "image data",
# 			"eventType:": {
# 				"description": "Basketball Game"
# 			},
# 			"arena": {
# 				"arena_name": "Madison Square Garden",
# 				"city": "New York",
# 				"state": "New York"
# 			}
# 		},
# 		{
# 			"eventID": "12345",
# 			"description": "Beyonce Concert",
# 			"eventDateTime": 1536425966,
# 			"eventImage": "image data",
# 			"eventType:": {
# 				"description": "Concert"
# 			},
# 			"arena": {
# 				"arena_name": "Madison Square Garden",
# 				"city": "New York",
# 				"state": "New York"
# 			}
# 		}
# 	]
# }
