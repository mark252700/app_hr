class OtherPerfromedsController < ApplicationController
  before_action :set_other_perfromed, only: %i[ show edit update destroy ]

  # GET /other_perfromeds or /other_perfromeds.json
  def index
    @other_perfromeds = OtherPerfromed.all
  end

  # GET /other_perfromeds/1 or /other_perfromeds/1.json
  def show
  end

  # GET /other_perfromeds/new
  def new
    @other_perfromed = OtherPerfromed.new
  end

  # GET /other_perfromeds/1/edit
  def edit
  end

  # POST /other_perfromeds or /other_perfromeds.json
  def create
    @other_perfromed = OtherPerfromed.new(other_perfromed_params)

    respond_to do |format|
      if @other_perfromed.save
        format.html { redirect_to other_perfromed_url(@other_perfromed), notice: "Other perfromed was successfully created." }
        format.json { render :show, status: :created, location: @other_perfromed }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @other_perfromed.errors, status: :unprocessable_entity }
      end
    end
  end

  # Assuming @other_perfromed has a belongs_to association with :req_training

# PATCH/PUT /other_perfromeds/1 or /other_perfromeds/1.json
def update
  respond_to do |format|
    if @other_perfromed.update(other_perfromed_params)
      if @other_perfromed.req_training&.user_id.present?
        format.html { redirect_to edit_req_training_path(user_id: @other_perfromed.req_training.user_id) }
      else
        format.html { redirect_to new_req_training_path }
      end
      format.json { render :show, status: :ok, location: @other_perfromed }
    else
      format.html { render :edit, status: :unprocessable_entity }
      format.json { render json: @other_perfromed.errors, status: :unprocessable_entity }
    end
  end
end


  # DELETE /other_perfromeds/1 or /other_perfromeds/1.json
  def destroy
    @other_perfromed.destroy

    respond_to do |format|
      format.html { redirect_to other_perfromeds_url, notice: "Other perfromed was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_other_perfromed
      @other_perfromed = OtherPerfromed.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def other_perfromed_params
      params.require(:other_perfromed).permit(:job_performed, :job_done, :job_hr, :job_min, :job_current, :job_reason)
    end
end
