class TaskperformancesController < ApplicationController
  before_action :set_taskperformance, only: %i[ show edit update destroy ]



  # GET /taskperformances or /taskperformances.json
  def index
    @taskperformances = Taskperformance.all
  end

  # GET /taskperformances/1 or /taskperformances/1.json
  def show
  end

  # GET /taskperformances/new
  def new
    if Taskperformance.exists?(user_id: current_user.id)
      redirect_to new_oth_performed_path
    else
       @taskperformance = Taskperformance.new

       @taskperformance.competencies.build
    end
    set_button_label('Next')
  end

  # GET /taskperformances/1/edit
  def edit
    if @taskperformance.blank?
      redirect_to new_taskperformance_path
    end
    set_button_label('Save')
  end

  def create
    @taskperformance = Taskperformance.new(task_performance_params)
    @taskperformance.user = current_user

    respond_to do |format|
      if @taskperformance.save
        format.html { redirect_to new_oth_performed_path }
        format.json { render :show, status: :created, location: @taskperformance }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @taskperformance.errors, status: :unprocessable_entity }
        puts "Error: #{@taskperformance.errors.full_messages}" # Change this line
      end
    end
  end


  # PATCH/PUT /taskperformances/1 or /taskperformances/1.json
  def update
    respond_to do |format|
      if @taskperformance.update(task_performance_params) # Change this line

        format.html { redirect_to edit_oth_performed_path }
        format.json { render :show, status: :ok, location: @taskperformance }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @taskperformance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /taskperformances/1 or /taskperformances/1.json
  def destroy
    @taskperformance.destroy

    respond_to do |format|
      format.html { redirect_to taskperformances_url, notice: "Taskperformance was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def set_button_label(label)
    @button_label = label
  end
    # Use callbacks to share common setup or constraints between actions.
    def set_taskperformance
      @taskperformance = Taskperformance.find(params[:id])
      if @taskperformance.nil?
        redirect_to new_taskperformance_path
      end
    end

    def task_performance_params
      params.require(:taskperformance).permit(
        :task_notdone,
        :task_reason,
        :task_impact,
        nested_taskperfomances_attributes: [:id,:task_notdone, :task_reason, :task_impact, :_destroy],
        competencies_attributes: [:id,:competencies, :_destroy]
      )
    end


end
