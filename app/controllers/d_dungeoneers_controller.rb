class DDungeoneersController < ApplicationController
  before_action :set_d_dungeoneer, only: [:show, :edit, :update, :destroy]

  # GET /d_dungeoneers
  # GET /d_dungeoneers.json
  def index
    @d_dungeoneers = DDungeoneer.all
  end

  # GET /d_dungeoneers/1
  # GET /d_dungeoneers/1.json
  def show
    update_skills_points
  end

  # GET /d_dungeoneers/new
  def new
    @d_dungeoneer = DDungeoneer.new
    @d_dungeoneer.fo = random_carac
    @d_dungeoneer.coo = random_carac
    @d_dungeoneer.mem = random_carac
    @d_dungeoneer.vol = random_carac
  end

  # GET /d_dungeoneers/1/edit
  def edit
    @update_lock = true
  end

  # POST /d_dungeoneers
  # POST /d_dungeoneers.json
  # TODO : need to create the skill link on select attack item
  def create
    @d_dungeoneer = DDungeoneer.new(d_dungeoneer_params)

    ActiveRecord::Base.transaction do
      respond_to do |format|
        if @d_dungeoneer.save
          format.html { redirect_to @d_dungeoneer, notice: 'D dungeoneer was successfully created.' }
          format.json { render :show, status: :created, location: @d_dungeoneer }
        else
          format.html { render :new }
          format.json { render json: @d_dungeoneer.errors, status: :unprocessable_entity }
        end
      end
    end

  end

  # PATCH/PUT /d_dungeoneers/1
  # PATCH/PUT /d_dungeoneers/1.json
  def update
    ActiveRecord::Base.transaction do
      respond_to do |format|
        if @d_dungeoneer.update(d_dungeoneer_params)
          update_skills_points
          update_skills_status
          format.html { redirect_to @d_dungeoneer, notice: 'D dungeoneer was successfully updated.' }
          format.json { render :show, status: :ok, location: @d_dungeoneer }
        else
          format.html { render :edit }
          format.json { render json: @d_dungeoneer.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # DELETE /d_dungeoneers/1
  # DELETE /d_dungeoneers/1.json
  def destroy
    @d_dungeoneer.destroy
    respond_to do |format|
      format.html { redirect_to d_dungeoneers_url, notice: 'D dungeoneer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_d_dungeoneer
      @d_dungeoneer = DDungeoneer.find(params[:id])
    end

    def update_skills_status
    end

    def update_skills_points
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def d_dungeoneer_params
      params.require(:d_dungeoneer).permit(:name, :desc, :fo, :coo, :mem, :vol, :c_class_id, :attack_item_id )
    end

    def random_carac
      3.times.map{ rand( 1..6 ) }.reduce(&:+)
    end
end
