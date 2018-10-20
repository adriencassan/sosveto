class GardesController < ApplicationController
  def index
    @gardes = policy_scope(Garde).order(created_at: :desc)
  end

  def show
    @garde = Garde.find(1)
    authorize @garde
    @consultations = @garde.consultations
  end
end
