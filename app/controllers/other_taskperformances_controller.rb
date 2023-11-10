class OtherTaskperformancesController < ApplicationController
  before_action :set_other_taskperformance, only: %i[ show edit update destroy ]

  # GET /other_taskperformances or /other_taskperformances.json
  def index
    @other_taskperformances = OtherTaskperformance.all
  end

  # GET /other_taskperformances/1 or /other_taskperformances/1.json
  def show
  end

  # GET /other_taskperformances/new
  def new
    @other_taskperformance = OtherTaskperformance.new
  end

  # GET /other_taskperformances/1/edit
  def edit
  end

  # POST /other_taskperformances or /other_taskperformances.json
  def create
    @other_taskperformance = OtherTaskperformance.new(other_taskperformance_params)

    respond_to do |format|
      if @other_taskperformance.save
        format.html { redirect_to other_taskperformance_url(@other_taskperformance), notice: "Other taskperformance was successfully created." }
        format.json { render :show, status: :created, location: @other_taskperformance }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @other_taskperformance.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /other_taskperformances/1 or /other_taskperformances/1.json
  def update
    respond_to do |format|
      if @other_taskperformance.update(other_taskperformance_params)
        format.html { redirect_to other_taskperformance_url(@other_taskperformance), notice: "Other taskperformance was successfully updated." }
        format.json { render :show, status: :ok, location: @other_taskperformance }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @other_taskperformance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /other_taskperformances/1 or /other_taskperformances/1.json
  def destroy
    @other_taskperformance.destroy

    respond_to do |format|
      format.html { redirect_to other_taskperformances_url, notice: "Other taskperformance was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_other_taskperformance
      @other_taskperformance = OtherTaskperformance.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def other_taskperformance_params
      params.require(:other_taskperformance).permit(:task_notdone, :task_reason, :task_impact)
    end
end
