class GardesController < ApplicationController
  def index
    @gardes = Garde.all
  end

  def show
    @garde = Garde.find(1)
    @consultations = @garde.consultations
  end
end
