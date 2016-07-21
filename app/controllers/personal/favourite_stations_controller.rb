class Personal::FavouriteStationsController < ApplicationController
  before_action :require_permission!, only: :remove
  before_action :prepare_favourite_station, only: :remove

  def add
    @station_id = params[:station_id]
    current_user.favourite_stations.create(station_id: params[:station_id])
  end

  def remove
    return unless @favourite_station
    @station_id = params[:station_id]
    @favourite_station.destroy
  end

  private

  def require_permission!
    return redirect_to :back if current_user.role_id != params[:customer_id].to_i
  end

  def prepare_favourite_station
    @favourite_station = FavouriteStation.find_by_customer_id_and_station_id(params[:customer_id],
                                                                             params[:station_id])
  end
end
