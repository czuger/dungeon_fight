class FFightsController < ApplicationController
  before_action :set_c_combat, only: [:edit, :update, :destroy]

  include GameLogicController::Combat

  # GET /c_combats
  # GET /c_combats.json
  def index
    @f_fights = FFight.all.order('id DESC' )
  end

  # GET /c_combats/1
  # GET /c_combats/1.json
  def show
    @f_fight = FFight.includes(d_dungeoneers: :attack_item, m_monsters: :attack_item).find(params[:id])
  end

  # GET /c_combats/new
  def new
    @f_fight = FFight.new
  end

  # GET /c_combats/1/edit
  def edit
  end

  # POST /c_combats
  # POST /c_combats.json
  def create

    monsters = [ MMonster.find( params[:monster] ) ]
    dungeoneers = params[:dungeoneers].values.reject{ |e| e.empty? }.map{ |e| DDungeoneer.find( e ) }

    dungeoneers.each do |dungeoneer|
      unless dungeoneer.attack_item
        # TODO : redirect to a dedicated page
        raise "#{dungeoneer.name} does not have an attack item"
      end
    end

    f_fight = FFight.new()
    respond_to do |format|
      if f_fight.save
        f_fight.resolve_combat(monsters, dungeoneers )
        format.html { redirect_to f_fight, notice: 'C combat was successfully created.' }
        format.json { render :show, status: :created, location: co_combat }
      else
        format.html { render :new }
        format.json { render json: co_combat.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /c_combats/1
  # PATCH/PUT /c_combats/1.json
  def update
    respond_to do |format|
      if @f_fight.update(c_combat_params)
        format.html { redirect_to @f_fight, notice: 'C combat was successfully updated.' }
        format.json { render :show, status: :ok, location: co_combat }
      else
        format.html { render :edit }
        format.json { render json: co_combat.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /c_combats/1
  # DELETE /c_combats/1.json
  def destroy
    @f_fight.destroy
    respond_to do |format|
      format.html { redirect_to f_fights_url, notice: 'C combat was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_c_combat
      @f_fight = FFight.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def c_combat_params
      params.require(:co_combat).permit()
    end

end
