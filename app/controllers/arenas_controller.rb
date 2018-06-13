class ArenasController < ApplicationController
  before_action :set_arena, only: [:show, :update, :destroy]
  def index
    @Arenas = Arena.all
    render json: @Arenas
  end

  def create
    @Arena = Arena.create(arena_params)
    render json: @Arena
  end

  def show
    render json: @arena
  end

  def update
    @arena.update(arena_params)
    render json: @arena
  end

  def destroy
    @arena.destroy
    render json: Arena.all
  end

  private

  def set_arena
    @arena = Arena.find(params[:id])
  end

  def arena_params
    params.permit(:first_name, :last_name, :phone_number, :terms_of_agreement)
  end
end
