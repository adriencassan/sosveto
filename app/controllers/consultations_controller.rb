class ConsultationsController < ApplicationController

  def index
    Consultations.scope.where(garde: params[:id])
  end
end
