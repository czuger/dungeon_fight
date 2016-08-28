class CCombatsController < ApplicationController
  before_action :set_c_combat, only: [:show, :edit, :update, :destroy]

  # GET /c_combats
  # GET /c_combats.json
  def index
    @c_combats = CCombat.all
  end

  # GET /c_combats/1
  # GET /c_combats/1.json
  def show
  end

  # GET /c_combats/new
  def new
    @c_combat = CCombat.new
  end

  # GET /c_combats/1/edit
  def edit
  end

  # POST /c_combats
  # POST /c_combats.json
  def create
    @c_combat = CCombat.new(c_combat_params)

    respond_to do |format|
      if @c_combat.save
        format.html { redirect_to @c_combat, notice: 'C combat was successfully created.' }
        format.json { render :show, status: :created, location: @c_combat }
      else
        format.html { render :new }
        format.json { render json: @c_combat.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /c_combats/1
  # PATCH/PUT /c_combats/1.json
  def update
    respond_to do |format|
      if @c_combat.update(c_combat_params)
        format.html { redirect_to @c_combat, notice: 'C combat was successfully updated.' }
        format.json { render :show, status: :ok, location: @c_combat }
      else
        format.html { render :edit }
        format.json { render json: @c_combat.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /c_combats/1
  # DELETE /c_combats/1.json
  def destroy
    @c_combat.destroy
    respond_to do |format|
      format.html { redirect_to c_combats_url, notice: 'C combat was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_c_combat
      @c_combat = CCombat.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def c_combat_params
      params.require(:c_combat).permit(:result)
    end
end
