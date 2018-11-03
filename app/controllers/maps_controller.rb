class MapsController < ApplicationController
  def index
    @maps = Map.all
  end

  def new
    @map = Map.new
  end

  def show
    @map = Map.find(params[:id])
    @users = User.all
  end

  def edit
    @map = Map.find(params[:id])
  end

  def update
    @map = Mam.find(params[:id])
    map.Update
    if @map.save
      redirect_to maps_path
    else
      rendar :new
    end
  end




end
