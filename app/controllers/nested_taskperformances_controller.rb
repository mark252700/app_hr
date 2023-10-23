class NestedTaskperformancesController < ApplicationController
  before_action :set_nested_taskperformance, only: %i[ show edit update destroy ]

  # GET /nested_taskperformances or /nested_taskperformances.json
  def index
    @nested_taskperformances = NestedTaskperformance.all
  end

  # GET /nested_taskperformances/1 or /nested_taskperformances/1.json
  def show
  end

  # GET /nested_taskperformances/new
  def new
    @nested_taskperformance = NestedTaskperformance.new
  end

  # GET /nested_taskperformances/1/edit
  def edit
  end

  # POST /nested_taskperformances or /nested_taskperformances.json
  def create
    @nested_taskperformance = NestedTaskperformance.new(nested_taskperformance_params)

    respond_to do |format|
      if @nested_taskperformance.save
        format.html { redirect_to nested_taskperformance_url(@nested_taskperformance), notice: "Nested taskperformance was successfully created." }
        format.json { render :show, status: :created, location: @nested_taskperformance }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @nested_taskperformance.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /nested_taskperformances/1 or /nested_taskperformances/1.json
  def update
    respond_to do |format|
      if @nested_taskperformance.update(nested_taskperformance_params)
        format.html { redirect_to nested_taskperformance_url(@nested_taskperformance), notice: "Nested taskperformance was successfully updated." }
        format.json { render :show, status: :ok, location: @nested_taskperformance }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @nested_taskperformance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /nested_taskperformances/1 or /nested_taskperformances/1.json
  def destroy
    @nested_taskperformance.destroy

    respond_to do |format|
      format.html { redirect_to nested_taskperformances_url, notice: "Nested taskperformance was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_nested_taskperformance
      @nested_taskperformance = NestedTaskperformance.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def nested_taskperformance_params
      params.require(:nested_taskperformance).permit(:task_notdone, :task_reason, :task_impact)
    end
end
