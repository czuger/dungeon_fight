class MMonstersController < ApplicationController
  before_action :set_m_monster, only: [:show, :edit, :update, :destroy]

  # GET /m_monsters
  # GET /m_monsters.json
  def index
    @m_monsters = MMonster.all
  end

  # GET /m_monsters/1
  # GET /m_monsters/1.json
  def show
  end

  # GET /m_monsters/new
  def new
    @m_monster = MMonster.new
  end

  # GET /m_monsters/1/edit
  def edit
  end

  # POST /m_monsters
  # POST /m_monsters.json
  def create
    @m_monster = MMonster.new(m_monster_params)

    respond_to do |format|
      if @m_monster.save
        format.html { redirect_to @m_monster, notice: 'M monster was successfully created.' }
        format.json { render :show, status: :created, location: @m_monster }
      else
        format.html { render :new }
        format.json { render json: @m_monster.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /m_monsters/1
  # PATCH/PUT /m_monsters/1.json
  def update
    respond_to do |format|
      if @m_monster.update(m_monster_params)
        format.html { redirect_to @m_monster, notice: 'M monster was successfully updated.' }
        format.json { render :show, status: :ok, location: @m_monster }
      else
        format.html { render :edit }
        format.json { render json: @m_monster.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /m_monsters/1
  # DELETE /m_monsters/1.json
  def destroy
    @m_monster.destroy
    respond_to do |format|
      format.html { redirect_to m_monsters_url, notice: 'M monster was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_m_monster
      @m_monster = MMonster.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def m_monster_params
      params.require(:m_monster).permit(:name, :desc, :attack_level, :attack_item_id)
    end
end
