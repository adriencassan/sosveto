class GardesController < ApplicationController
  def index
    Garde.all
  end

  def show
    @garde = Garde.find(params[:id])
    @consultations = @garde.consultations
  end
end
