class AuthenticationsController < ApplicationController
  require 'securerandom'
  require 'date'

  # def index
  #   # @authentication = Authentication.create({user: @user, auth_string: @user.password})
  #   byebug
  #   if params[:id]
  #     @authenications = Authentication.with_user_id(params[:id])
  #   else
  #     @authentications = Authentication
  #   end
  #   render json: @authentications
  # end

  def create
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      @events = Event.joins(:arena, :event_type).where(arena_id: 1).uniq
      @authentication = Authentication.create_with(auth_string: @user.password).find_or_create_by(user: @user)
      @authentication.update({session_id: SecureRandom.uuid, last_request_datetime: DateTime.now})
      @events = id_to_hash(@events)
      render json: {email: @user.email, userId: @user.id, firstName: @user.first_name, lastName: @user.last_name, lastRequestDatetime: @authentication.last_request_datetime, sessionId: @authentication.session_id, events: @events}
    else
      render({json: {error: 'User is invalid'}, status: 401})
    end
  end

  def id_to_hash events
    events.map do |event|
      ans = event.attributes
      ans[:arena] = Arena.where(id: event.arena_id)
      ans[:eventType] = EventType.where(id: event.event_type_id)
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
