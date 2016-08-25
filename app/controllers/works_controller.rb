class WorksController < ApplicationController
  before_action :set_work, only: [:show, :edit, :update, :destroy]

  # GET /works
  # GET /works.json
  def index
    @works = Work.all
  end

  # GET /works/1
  # GET /works/1.json
  def show
    @car = @work.car
    @client = @car.client
    respond_to do |format|
      format.html
      format.pdf do
        render :pdf => "my_pdf_name.pdf",
                :disposition => "inline",
                :template => "works/pdf.html.erb",
                :layout => "pdf"
      end 
      #{
      #  html = render_to_string(:layout => false, :template => "works/pdf.html.erb")
      #  kit = PDFKit.new(html, :page_size => "A4")
      #  kit.stylesheets << "#{Rails.root}/app/assets/stylesheets/pdf.css"
      #  send_data(kit.to_pdf, :filename => "some_name.pdf", :type => 'application/pdf')
      #  return
      #}
      end
  end


  # GET /works/new
  def new
    @work = Work.new
    @car = params[:id]
  end

  # GET /works/1/edit
  def edit
  end

  # POST /works
  # POST /works.json
  def create
    @work = Work.new(work_params)
    @car = Car.find(params.require(:work).permit(:car)["car"])
    @car.works << @work

    @car.kilometraje = @work.kilometraje

    respond_to do |format|
      if @work.save
        @car.save
        format.html { redirect_to @work, notice: 'Work was successfully created.' }
        format.json { render :show, status: :created, location: @work }
      else
        format.html { render :new }
        format.json { render json: @work.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /works/1
  # PATCH/PUT /works/1.json
  def update
    respond_to do |format|
      if @work.update(work_params)
        format.html { redirect_to @work, notice: 'Work was successfully updated.' }
        format.json { render :show, status: :ok, location: @work }
      else
        format.html { render :edit }
        format.json { render json: @work.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /works/1
  # DELETE /works/1.json
  def destroy
    @work.destroy
    respond_to do |format|
      format.html { redirect_to works_url, notice: 'Work was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_work
      @work = Work.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def work_params
      params.require(:work).permit(:motivo, :tipo, :kilometraje).merge(:estanque => params[:estanque])
    end
end
