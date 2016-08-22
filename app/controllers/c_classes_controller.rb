class CClassesController < ApplicationController
  before_action :set_c_class, only: [:show, :edit, :update, :destroy]

  # GET /c_classes
  # GET /c_classes.json
  def index
    @c_classes = CClass.all
  end

  # GET /c_classes/1
  # GET /c_classes/1.json
  def show
  end

  # GET /c_classes/new
  def new
    @c_class = CClass.new
    get_skills
  end

  # GET /c_classes/1/edit
  def edit
    get_skills
  end

  # POST /c_classes
  # POST /c_classes.json
  def create
    @c_class = CClass.new(c_class_params)

    respond_to do |format|
      if @c_class.save
        set_skills
        format.html { redirect_to @c_class, notice: 'C class was successfully created.' }
        format.json { render :show, status: :created, location: @c_class }
      else
        format.html { render :new }
        format.json { render json: @c_class.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /c_classes/1
  # PATCH/PUT /c_classes/1.json
  def update
    respond_to do |format|
      if @c_class.update(c_class_params)
        set_skills
        format.html { redirect_to @c_class, notice: 'C class was successfully updated.' }
        format.json { render :show, status: :ok, location: @c_class }
      else
        format.html { render :edit }
        format.json { render json: @c_class.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /c_classes/1
  # DELETE /c_classes/1.json
  def destroy
    @c_class.destroy
    respond_to do |format|
      format.html { redirect_to c_classes_url, notice: 'C class was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_c_class
      @c_class = CClass.find(params[:id])
    end

    def set_skills
      @c_class.s_skill_ids = params[:skills]
    end

    def get_skills
      @skills = SSkill.all.order( :name )
      @set_skills = @c_class ? @c_class.s_skill_ids : []
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def c_class_params
      params.require(:c_class).permit(:name, :desc)
    end
end
