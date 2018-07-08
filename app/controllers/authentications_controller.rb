class AuthenticationsController < ApplicationController
  require 'securerandom'
  def create
    user = User.find_by(username: params[:username])


  end
end
