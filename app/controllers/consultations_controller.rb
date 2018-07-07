class ConsultationsController < ApplicationController

  def index
    Consultations.where(garde: params[:id])
  end
end
