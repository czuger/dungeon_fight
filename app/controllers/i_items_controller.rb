class IItemsController < ApplicationController
  before_action :set_i_item, only: [:show, :edit, :update, :destroy]

  # GET /i_items
  # GET /i_items.json
  def index
    @i_items = IItem.all
  end

  # GET /i_items/1
  # GET /i_items/1.json
  def show
  end

  # GET /i_items/new
  def new
    @i_item = IItem.new
  end

  # GET /i_items/1/edit
  def edit
  end

  # POST /i_items
  # POST /i_items.json
  def create
    @i_item = IItem.new(i_item_params)

    respond_to do |format|
      if @i_item.save
        format.html { redirect_to @i_item, notice: 'I item was successfully created.' }
        format.json { render :show, status: :created, location: @i_item }
      else
        format.html { render :new }
        format.json { render json: @i_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /i_items/1
  # PATCH/PUT /i_items/1.json
  def update
    respond_to do |format|
      if @i_item.update(i_item_params)
        format.html { redirect_to @i_item, notice: 'I item was successfully updated.' }
        format.json { render :show, status: :ok, location: @i_item }
      else
        format.html { render :edit }
        format.json { render json: @i_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /i_items/1
  # DELETE /i_items/1.json
  def destroy
    @i_item.destroy
    respond_to do |format|
      format.html { redirect_to i_items_url, notice: 'I item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_i_item
      @i_item = IItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def i_item_params
      params.require(:i_item).permit(:name, :desc, :difficulty, :attack_dice, :c_class_id, :min_level)
    end
end
