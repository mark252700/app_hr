class OthTasksController < ApplicationController
  before_action :set_oth_task, only: %i[ show edit update destroy ]

  # GET /oth_tasks or /oth_tasks.json
  def index
    @oth_tasks = OthTask.all
  end

  # GET /oth_tasks/1 or /oth_tasks/1.json
  def show
  end

  # GET /oth_tasks/new
  def new
    @oth_task = OthTask.new
  end

  # GET /oth_tasks/1/edit
  def edit
  end

  # POST /oth_tasks or /oth_tasks.json
  def create
    @oth_task = OthTask.new(oth_task_params)

    respond_to do |format|
      if @oth_task.save
        format.html { redirect_to oth_task_url(@oth_task), notice: "Oth task was successfully created." }
        format.json { render :show, status: :created, location: @oth_task }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @oth_task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /oth_tasks/1 or /oth_tasks/1.json
  def update
    respond_to do |format|
      if @oth_task.update(oth_task_params)
        format.html { redirect_to oth_task_url(@oth_task), notice: "Oth task was successfully updated." }
        format.json { render :show, status: :ok, location: @oth_task }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @oth_task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /oth_tasks/1 or /oth_tasks/1.json
  def destroy
    @oth_task.destroy

    respond_to do |format|
      format.html { redirect_to oth_tasks_url, notice: "Oth task was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_oth_task
      @oth_task = OthTask.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def oth_task_params
      params.require(:oth_task).permit(:oth_tasknotdone, :oth_reason, :oth_impact)
    end
end
