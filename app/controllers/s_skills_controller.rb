class SSkillsController < ApplicationController
  before_action :set_s_skill, only: [:show, :edit, :update, :destroy]

  # GET /s_skills
  # GET /s_skills.json
  def index
    @s_skills = SSkill.all
  end

  # GET /s_skills/1
  # GET /s_skills/1.json
  def show
  end

  # GET /s_skills/new
  def new
    @s_skill = SSkill.new
  end

  # GET /s_skills/1/edit
  def edit
  end

  # POST /s_skills
  # POST /s_skills.json
  def create
    @s_skill = SSkill.new(s_skill_params)

    respond_to do |format|
      if @s_skill.save
        format.html { redirect_to @s_skill, notice: 'S skill was successfully created.' }
        format.json { render :show, status: :created, location: @s_skill }
      else
        format.html { render :new }
        format.json { render json: @s_skill.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /s_skills/1
  # PATCH/PUT /s_skills/1.json
  def update
    respond_to do |format|
      if @s_skill.update(s_skill_params)
        format.html { redirect_to @s_skill, notice: 'S skill was successfully updated.' }
        format.json { render :show, status: :ok, location: @s_skill }
      else
        format.html { render :edit }
        format.json { render json: @s_skill.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /s_skills/1
  # DELETE /s_skills/1.json
  def destroy
    @s_skill.destroy
    respond_to do |format|
      format.html { redirect_to s_skills_url, notice: 'S skill was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_s_skill
      @s_skill = SSkill.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def s_skill_params
      params.require(:s_skill).permit(:name, :desc, :difficulty)
    end
end
