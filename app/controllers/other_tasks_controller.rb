class OtherTasksController < ApplicationController
  before_action :set_other_task, only: %i[ show edit update destroy ]

  # GET /other_tasks or /other_tasks.json
  def index
    @other_tasks = OtherTask.all
  end

  # GET /other_tasks/1 or /other_tasks/1.json
  def show
  end

  # GET /other_tasks/new
  def new
    @other_task = OtherTask.new
  end

  # GET /other_tasks/1/edit
  def edit
  end

  # POST /other_tasks or /other_tasks.json
  def create
    @other_task = OtherTask.new(other_task_params)

    respond_to do |format|
      if @other_task.save
        format.html { redirect_to other_task_url(@other_task), notice: "Other task was successfully created." }
        format.json { render :show, status: :created, location: @other_task }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @other_task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /other_tasks/1 or /other_tasks/1.json
  def update
    respond_to do |format|
      if @other_task.update(other_task_params)
        format.html { redirect_to other_task_url(@other_task), notice: "Other task was successfully updated." }
        format.json { render :show, status: :ok, location: @other_task }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @other_task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /other_tasks/1 or /other_tasks/1.json
  def destroy
    @other_task.destroy

    respond_to do |format|
      format.html { redirect_to other_tasks_url, notice: "Other task was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_other_task
      @other_task = OtherTask.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def other_task_params
      params.require(:other_task).permit(:task_notdone, :task_reason, :task_impact)
    end
end
