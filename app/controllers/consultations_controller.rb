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
     authorize @consultation

    if @consultation.update(consultation_params)
      redirect_to duty_path(@consultation.duty)
    else
      render 'form', @consultation
    end
  end

  def pdf
    @duty=Duty.find(params[:duty_id])
    @consultation = Consultation.find(params[:consultation_id])
    authorize @consultation

    pdf_file = render_to_string pdf: "some_file_name", template: "consultations/pdf/show.html.erb", layout: 'pdf.html.erb', page_size: "A4", encoding: "UTF-8"

    # Write it to tempfile
    tempfile = Tempfile.new(['invoice', '.pdf'], Rails.root.join('tmp'))
    tempfile.binmode
    tempfile.write pdf_file
    tempfile.close

    #File.open(tempfile.path)

    # Attach that tempfile to the invoice
    unless pdf_file.blank?
        #@consultation.clear
        @consultation.update(report: File.open(tempfile.path))
        tempfile.unlink
    end

    redirect_to duty_consultation_path(@duty, @consultation)
  end


  protected

  def consultation_params
    params.require(:consultation).permit(:date, :comment_reason, :comment_description, :comment_treatment, :comment_next_step, :pet_weight, :pet_temperature, :pet_appetite, :pet_thirst, :pet_condition, :pet_mucosa, :pet_heart_rate, :pet_dehydration, :report, :report_cache, :report_status, client_attributes: [:id, :last_name, :first_name, :adr_line1, :adr_line2, :adr_zip, :adr_city, :adr_country, :email, :phone], pet_attributes: [:id, :pet_birth, :pet_gender, :pet_specie, :pet_breed, :pet_is_mixed_breed, :pet_is_lof, :pet_colour, :pet_is_sterilized, :pet_is_vaccinated ] )
  end
end
