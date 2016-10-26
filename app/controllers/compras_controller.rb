class ComprasController < ApplicationController
  before_action :set_compra, only: [:show, :edit, :update, :destroy]

  # GET /compras
  # GET /compras.json
  def index
    @compras = Compra.order('compras.created_at DESC').paginate(:page => params[:page], :per_page => 15)
  end

  # GET /compras/1
  # GET /compras/1.json
  def show
  end

  # GET /compras/new
  def new
    @compra = Compra.new
    @boton = "Ingresar compra"
  end

  # GET /compras/1/edit
  def edit
    @boton = "Editar"
  end

  # POST /compras
  # POST /compras.json
  def create
    @compra = Compra.new(compra_params)
    @compra.remaining = @compra.cantidad
    @compra.code = Item.find(compra_params[:producto]).identificador
    respond_to do |format|
      if @compra.save
        format.html { redirect_to compras_path, notice: 'Compra was successfully created.' }
        format.json { render :show, status: :created, location: @compra }
      else
        format.html { render :new }
        format.json { render json: @compra.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /compras/1
  # PATCH/PUT /compras/1.json
  def update
    nueva_cantidad = compra_params[:cantidad].to_i

    respond_to do |format|
      if @compra.edit_stock(nueva_cantidad) && @compra.update(compra_params)
        format.html { redirect_to @compra, notice: 'Compra was successfully updated.' }
        format.json { render :show, status: :ok, location: @compra }
      else
        format.html { render :edit }
        format.json { render json: @compra.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /compras/1
  # DELETE /compras/1.json
  def destroy
    @compra.destroy
    respond_to do |format|
      format.html { redirect_to compras_url, notice: 'Compra was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_compra
      @compra = Compra.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def compra_params
      params.require(:compra).permit(:producto, :p_compra, :p_venta, :cantidad)
    end
end
