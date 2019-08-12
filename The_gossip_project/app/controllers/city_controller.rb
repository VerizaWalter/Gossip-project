class CityController < ApplicationController
  def show
    @gossip = City.find(params[:id])
  end
 end