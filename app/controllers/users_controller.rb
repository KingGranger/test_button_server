class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]
  def index
    @Users = User.all
    render json: @Users
  end


  def create
    @user = User.create(user_params)

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
    @user = User.find(params[:id])
  end

  def user_params
    params.permit(:first_name, :last_name, :phone_number, :terms_of_agreement)
  end
end
