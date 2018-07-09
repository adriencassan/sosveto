class ConsultationsController < ApplicationController

  def index
    Consultation.where(garde: params[:id])
  end

  def edit
    @garde = Garde.find(params[:garde_id])
    @consultation = Consultation.find(params[:id])
  end

  def update
    @consultation = Consultation.find(params[:id])
    if @consultation.update(consultation_params)
      redirect_to garde_path(@consultation.garde)
    else
      render 'form', @consultation
    end
  end


  protected

  def consultation_params
    params.require(:consultation).permit(:client_nom, :client_adresse, :client_ville, :client_telephone, :client_mail, :client_clinique_id, :animal_nom, :animal_espece, :animal_sexe, :animal_ageA, :animal_ageM, :consultation_motif, :consultation_commentaires, :consultation_suites)
  end
end
