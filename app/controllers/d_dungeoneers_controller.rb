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
  def create
    @d_dungeoneer = DDungeoneer.new(d_dungeoneer_params)

    ActiveRecord::Base.transaction do
      respond_to do |format|
        if @d_dungeoneer.save

          @d_dungeoneer.c_class.s_skills.each do |skill|
            DDungeoneerSkill.create( d_dungeoneer_id: @d_dungeoneer.id, s_skill_id: skill.id )
          end

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
      # TODO : to fix
      if params[:learning_skill]
        if params[:learning_skill].empty?
          current_learning_skill = @d_dungeoneer.d_dungeoneer_skills.where( active: true ).first
          current_learning_skill.update_attributes( active: false ) if current_learning_skill
        else
          to_learn_skill = DDungeoneerSkill.where( d_dungeoneer_id: @d_dungeoneer.id, s_skill_id: params[:learning_skill] ).first
          to_learn_skill.update_attributes( active: true, active_since: Time.now ) if to_learn_skill
        end
      end
    end

    def update_skills_points
      d_d_skill = @d_dungeoneer.s_current_learning_d_dungeoneer_skill
      if d_d_skill
        time_spend = Time.now - d_d_skill.active_since
        d_d_skill.increment( :skills_points, time_spend )
        d_d_skill.update_attribute( :level, ( d_d_skill.skills_points**(1/5.0) ).floor )
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def d_dungeoneer_params
      params.require(:d_dungeoneer).permit(:name, :desc, :fo, :coo, :mem, :vol, :c_class_id)
    end

    def random_carac
      3.times.map{ rand( 1..6 ) }.reduce(&:+)
    end
end
