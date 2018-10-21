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

  def pdf
    @consultation = Consultation.find(params[:consultation_id])
    authorize @consultation
    ##respond_to do |format|
     ##format.html
     #format.pdf do
     #  render pdf: "test_name", template: "consultations/pdf/show.html.erb", layout: 'pdf.html.erb', page_size: "A4"
     #end
    #end
    ##render "consultations/pdf/show"


    #  render pdf: "test_name", template: "consultations/pdf/show.html.erb", layout: 'pdf.html.erb', page_size: "A4"

    pdf_file = render_to_string pdf: "some_file_name", template: "consultations/pdf/show.html.erb", layout: 'pdf.html.erb', page_size: "A4", encoding: "UTF-8"

    #File.open(pdf) do |f|
    #  @consultation.report = f
    #end



    #@consultation.report  = WickedPdf.new.pdf_from_string(render_to_string("consultations/pdf/show.html.erb", layout: 'pdf.html.erb', page_size: "A4", encoding: "UTF-8", layout: 'pdf'))
    #@consultation.report = pdf
    #@consultation.save!
    # then save to a file
    #save_path = Rails.root.join('pdfs','filename.pdf')
    #File.open(save_path, 'wb') do |file|
    #  file << pdf
    #end


    # Write it to tempfile
    tempfile = Tempfile.new(['invoice', '.pdf'], Rails.root.join('tmp'))
    tempfile.binmode
    tempfile.write pdf_file
    tempfile.close

    # Attach that tempfile to the invoice
    unless pdf_file.blank?
        #@consultation.clear
        @consultation.update(report: File.open(tempfile.path))
        tempfile.unlink
    end

    redirect_to "root"
  end


  protected

  def consultation_params
    params.require(:consultation).permit(:client_nom, :client_adresse, :client_ville, :client_telephone, :client_mail, :client_clinique_id, :animal_nom, :animal_espece, :animal_sexe, :animal_ageA, :animal_ageM, :consultation_motif, :consultation_commentaires, :consultation_suites)
  end
end
