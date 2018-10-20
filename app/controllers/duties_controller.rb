class DutiesController < ApplicationController
  def index
    @duties = policy_scope(Duty).order(created_at: :desc)
  end

  def show
    @duty = Duty.find(1)
    authorize @duty
    @consultations = @duty.consultations
  end
end
