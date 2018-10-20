class ConsultationsController < ApplicationController

  def index
    policy_scope(Consultation).where(duty: params[:id])
  end

  def show
    @duty = Duty.find(params[:duty_id])
    @consultation = Consultation.find(params[:id])
    authorize @consultation
  end

  def new
    @duty = Duty.find(params[:duty_id])
    @consultation = Consultation.new
  end

  def edit
    @duty = Duty.find(params[:duty_id])
    @consultation = Consultation.find(params[:id])
  end

  def create
    @duty = Duty.find(params[:duty_id])
    @consultation = Consultation.new(consultation_params)
    @consultation.duty = @duty
    if @consultation.save!
      redirect_to duty_path(@duty)
    else
      render 'form', @consultation
    end
  end

  def update
    @consultation = Consultation.find(params[:id])
    if @consultation.update(consultation_params)
      redirect_to duty_path(@consultation.duty)
    else
      render 'form', @consultation
    end
  end


  protected

  def consultation_params
    params.require(:consultation).permit(:client_nom, :client_adresse, :client_ville, :client_telephone, :client_mail, :client_clinique_id, :animal_nom, :animal_espece, :animal_sexe, :animal_ageA, :animal_ageM, :consultation_motif, :consultation_commentaires, :consultation_suites)
  end
end
