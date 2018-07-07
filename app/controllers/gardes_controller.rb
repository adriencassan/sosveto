class GardesController < ApplicationController
  def index
    Gardes.all
  end

  def show
    @garde = Garde.find(params[:id])
    @consultations = @garde.consultations
  end
end
