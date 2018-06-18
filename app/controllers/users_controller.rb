class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]
  def index
    @Users = User.all
    render json: @Users
  end


  def create
    @user = User.create(user_params)
    #raffle = @user.get_random_ticket_number(@user.id, @user.phone_number)
    #first_name: @user.first_name, last_name: @user.last_name, phone_number: @user.phone_number, raffle: raffle
    render json: @user
  end

  def show
    render json: @user
  end

  def update
    @user.update(user_params)
    render json: @user
  end

  def destroy
    @user.destroy
    render json: User.all
  end

  private

  def set_user
    @user = User.where(params[:id])
  end

  def user_params
    params.permit(:first_name, :last_name, :phone_number, :terms_of_agreement)
  end
end
