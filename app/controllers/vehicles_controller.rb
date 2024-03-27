class VehiclesController < ApplicationController
  before_action :set_vehicle, only: %i[ show ]

  def index
    @vehicles = Sti::Vehicle.all
  end

  def show
  end

  private
    def set_vehicle
      @vehicle = Sti::Vehicle.find(params[:id])
    end
end
