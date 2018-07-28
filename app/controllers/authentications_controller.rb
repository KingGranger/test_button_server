class AuthenticationsController < ApplicationController
  require 'securerandom'
  require 'date'

  def index
    @Authentications = Authentication.all
    render json: @Authentications
  end

  def create
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      @authentication = Authentication.find_by(user: @user)
      date = DateTime.now
      session_id = SecureRandom.uuid
      @authentication.update({session_id: session_id, last_request_datetime: date})
      render json: {email: @user.email, user_id: @user.id, last_request_datetime: @authentication.last_request_datetime, session_id: @authentication.session_id}
    else
      render({json: {error: 'User is invalid'}, status: 401})
    end
  end


  #securerandom generates the uuid key to save for the session
  #each session is 20 mins long set it to reset every 20 mins
end
