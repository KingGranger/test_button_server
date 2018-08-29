class ArenasController < ApplicationController
  before_action :set_arena, only: [:show, :update, :destroy]
  def index
    if params[:id] 
      @Arenas = Arena.with_id(params[:id])
    else
      @Arenas = Arena.all
    end
    render json: @Arenas
  end

  def create
    @arena = Arena.create(arena_params)
    render json: @arena
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
    @arena = Arena.where(params[:id])
  end

  def arena_params
    params.permit(:arena_name, :city, :state, :is_deleted)
  end

end
