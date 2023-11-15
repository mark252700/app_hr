class OtherPositionsController < ApplicationController
  before_action :set_other_position, only: %i[ show edit update destroy ]

  # GET /other_positions or /other_positions.json
  def index
    @other_positions = OtherPosition.all
  end

  # GET /other_positions/1 or /other_positions/1.json
  def show
  end

  # GET /other_positions/new
  def new
    @other_position = OtherPosition.new
    @other_position.other_perfromeds.build
    @other_position.other_taskperformances.build
    @other_position.other_competences.build
  end

  # GET /other_positions/1/edit
  def edit
    @other_position.other_perfromeds.build if @other_position.other_perfromeds.empty?
    @other_position.other_taskperformances.build if @other_position.other_taskperformances.empty?
    @other_position.other_competences.build if @other_position.other_competences.empty?
  end

  # POST /other_positions or /other_positions.json
def create
  @other_position = OtherPosition.new(other_position_params)
  @other_position.user = current_user

  respond_to do |format|
    if @other_position.save
      format.html { redirect_to new_oth_performed_path }
      format.json { render :show, status: :created, location: @other_position }
    else
      puts @other_position.errors.full_messages # Add this line for debugging
      format.html { render :new, status: :unprocessable_entity }
      format.json { render json: @other_position.errors, status: :unprocessable_entity }

      @other_position.other_perfromeds.build if @other_position.other_perfromeds.empty?
      @other_position.other_taskperformances.build if @other_position.other_taskperformances.empty?
      @other_position.other_competences.build if @other_position.other_competences.empty?
    end
  end
end




  # PATCH/PUT /other_positions/1 or /other_positions/1.json
def update
  respond_to do |format|
    if @other_position.update(other_position_params)
      format.html { redirect_to edit_oth_performed_path(current_user) }
      format.json { render :show, status: :ok, location: @other_position }
    else
      format.html { render :edit, status: :unprocessable_entity }
      format.json { render json: @other_position.errors, status: :unprocessable_entity }
      @other_position.other_perfromeds.build if @other_position.other_perfromeds.empty?
      @other_position.other_taskperformances.build if @other_position.other_taskperformances.empty?
      @other_position.other_competences.build if @other_position.other_competences.empty?
    end
  end
end



  # DELETE /other_positions/1 or /other_positions/1.json
  def destroy
    @other_position.destroy



    respond_to do |format|
      format.html { redirect_to new_oth_performed_path }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_other_position
      @other_position = OtherPosition.find(params[:id])
    end


   def other_position_params
  params.require(:other_position).permit(
    :pos_title, :pos_yr, :pos_month,
    other_perfromeds_attributes: [  # Use the plural form here
      :id,
      :job_performed,
      :job_done,
      :job_hr,
      :job_min,
      :job_reason,
      :job_current,
      :_destroy
    ],
    other_taskperformances_attributes: [:id, :task_notdone, :task_reason, :task_impact, :_destroy ],
    other_competences_attributes: [:id, :competencies, :_destroy]
  )

end


end
