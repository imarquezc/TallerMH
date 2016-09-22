class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  # GET /comments
  # GET /comments.json
  def index
    @comments = Comment.all
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
  end

  # GET /comments/new
  def new
    @comment = Comment.new
    @work = params[:id]
    respond_to do |format|
        format.js
    end
  end

  def new_w_item
    @comment = Comment.new
    @work = params[:id]
    respond_to do |format|
      format.js
    end
  end

  # GET /comments/1/edit
  def edit
  end

  # POST /comments
  # POST /comments.json


  def create
    @work = Work.find(params.require(:comment).permit(:work)['work'])
    if comment_params.has_key?(:producto)
      @producto = Item.find_by_identificador(comment_params[:producto])
      if @producto.comprobar_stock(comment_params[:precio])
        precio = @producto.usar(comment_params[:precio].to_i)
        @comment = Comment.new
        @comment.detalle = @producto.nombre
        @comment.precio = precio
        @comment.item_id = @producto.identificador
        @comment.cantidad = comment_params[:precio].to_i

      else
        @comment = Comment.new
      end

    else
      @comment = Comment.new(comment_params)
    end

    respond_to do |format|
      if @comment.save
        @work.comments << @comment
        format.html { redirect_to @comment, notice: 'Comment was successfully created.' }
        format.json { render :show, status: :created, location: @comment }
        format.js
      else
        format.html { render :new }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to @comment, notice: 'Comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @work = @comment.work

    if @comment.item_id?
      compra = Compra.new
      compra.producto = @comment.item_id
      compra.p_compra = 0
      compra.p_venta = @comment.precio/@comment.cantidad
      compra.cantidad = @comment.cantidad
      compra.remaining = @comment.cantidad
      compra.save
    end

    @comment.destroy
    respond_to do |format|
      format.json { head :no_content }
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:detalle, :precio, :producto)
    end
end
