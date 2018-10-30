class DutiesController < ApplicationController
  def index
    @month =  Date.strptime(params[:month] || Date.today.strftime("%B-%Y"),"%B-%Y")
    @duties = policy_scope(Duty).where(date_start: @month..@month.next_month).order(date_start: :asc)
  end

  def show
    @duty = Duty.find(params[:id])
    authorize @duty
    @consultations = @duty.consultations
  end

  def new
    @duty = Duty.new
    authorize @duty
  end

  def create
    @duty = Duty.new(duty_params)
    authorize @duty
    if @duty.save!
      redirect_to duties_path(month: @duty.date_start.strftime("%B-%Y"))
    else
      ## render error
    end
  end

  private

  def duty_params
    params.require(:duty).permit(:date_start,:date_end, :title, :clinic, :clinic_id)
  end
end
