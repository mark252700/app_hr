class OthPerformedsController < ApplicationController
  before_action :set_oth_performed, only: %i[ show edit update destroy ]

  # GET /oth_performeds or /oth_performeds.json
  def index
    @oth_performeds = OthPerformed.all
  end

  # GET /oth_performeds/1 or /oth_performeds/1.json
  def show
  end

  # GET /oth_performeds/new
  def new
    if OthPerformed.exists?(user_id: current_user.id)
      redirect_to new_req_training_path
    else
      @oth_performed = OthPerformed.new
    end
   
    set_button_label('Next')
  end

  # GET /oth_performeds/1/edit
  def edit
    set_button_label('Save')
  end

  # POST /oth_performeds or /oth_performeds.json
  def create
    @oth_performed = OthPerformed.new(oth_performed_params)
    @oth_performed.user = current_user
    respond_to do |format|
      if @oth_performed.save
        format.html { redirect_to new_req_training_path }
        format.json { render :show, status: :created, location: @oth_performed }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @oth_performed.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /oth_performeds/1 or /oth_performeds/1.json
  def update
    respond_to do |format|
      if @oth_performed.update(oth_performed_params)
        format.html { redirect_to edit_req_training_path }
        format.json { render :show, status: :ok, location: @oth_performed }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @oth_performed.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /oth_performeds/1 or /oth_performeds/1.json
  def destroy
    @oth_performed.destroy

    respond_to do |format|
      format.html { redirect_to oth_performeds_url, notice: "Oth performed was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def set_button_label(label)
    @button_label = label
  end
    # Use callbacks to share common setup or constraints between actions.
    def set_oth_performed
      # if params[:id].nil?
      #   redirect_to new_oth_performed_path
      # else
      @oth_performed = OthPerformed.find(params[:id])
    #   if @req_training.nil?
    #     redirect_to new_oth_performed_path
    #   end
    # end
    end

    # Only allow a list of trusted parameters through.
    def oth_performed_params
      params.require(:oth_performed).permit(
        :job_performed, :job_done, :job_hr, :job_min, :integer, :job_current, :job_reason,
        nested_othperformes_attributes: [ :id,:job_performed, :job_done, :job_hr, :job_min, :integer, :job_current, :job_reason, :_destroy],
        other_tasks_attributes: [:id,:task_notdone, :task_reason, :task_impact, :_destroy],
        other_competencies_attributes: [:id,:competencies, :_destroy],
        oth_position_attributes: [:pos_title, :pos_yr, :pos_month]
      )
    end
    
end
