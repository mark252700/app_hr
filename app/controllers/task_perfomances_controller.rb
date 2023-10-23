class TaskPerfomancesController < ApplicationController
  before_action :set_task_perfomance, only: %i[ show edit update destroy ]

  # GET /task_perfomances or /task_perfomances.json
  def index
    @task_perfomances = TaskPerfomance.all
  end

  # GET /task_perfomances/1 or /task_perfomances/1.json
  def show
  end

  # GET /task_perfomances/new
  def new
    @task_perfomance = TaskPerfomance.new
  end

  # GET /task_perfomances/1/edit
  def edit
  end

  # POST /task_perfomances or /task_perfomances.json
  def create
    @task_perfomance = TaskPerfomance.new(task_perfomance_params)
    @task_perfomance.user = current_user

    respond_to do |format|
      if @task_perfomance.save
        format.html { redirect_to new_oth_task_path }
        format.json { render :show, status: :created, location: @task_perfomance }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @task_perfomance.errors, status: :unprocessable_entity }
        puts "Error: #{task_perfomance.errors.full_messages}"
      end
    end
  end

  # PATCH/PUT /task_perfomances/1 or /task_perfomances/1.json
  def update
    respond_to do |format|
      if @task_perfomance.update(task_perfomance_params)
        format.html { redirect_to new_oth_task_path }
        format.json { render :show, status: :ok, location: @task_perfomance }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @task_perfomance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /task_perfomances/1 or /task_perfomances/1.json
  def destroy
    @task_perfomance.destroy

    respond_to do |format|
      format.html { redirect_to task_perfomances_url, notice: "Task perfomance was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task_perfomance
      @task_perfomance = TaskPerfomance.find(params[:id])
    end

    def task_perfomance_params
      params.require(:task_perfomance).permit(
        :task_notdone,
        :task_reason,
        :task_impact,
        competencies_attributes: [:competencies]
      )
    end
end
