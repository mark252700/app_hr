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
       @user_id = current_user.id
       @taskperformance.competencies.build
    end
    set_button_label('Next')
  end

  def edit
    @user_id = params[:user_id] || current_user.id
    @taskperformance = Taskperformance.find_by(user_id: @user_id)

    if @taskperformance.nil?
      redirect_to new_taskperformance_path, alert: "Taskperformance not found for current user"
    else
      set_button_label('Save')
      # Additional logic for the edit action if needed
    end
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
        set_button_label('next')
      end
    end
  end


  def update
    respond_to do |format|
      user_id = params[:user_id] || current_user.id

      if @taskperformance.update(task_performance_params)
        format.html { redirect_to edit_oth_performed_path(user_id: user_id) }
        format.json { render :show, status: :ok, location: @taskperformance }
      else
        format.html do
          render :edit, status: :unprocessable_entity

          # Add the redirect condition here
          if @taskperformance.nil?
            redirect_to new_taskperformance_path(user_id: user_id)
          else
            # Handle other associated records, for example, Competency
            @taskperformance.competencies.build if @taskperformance.competencies.empty?
          end
        end

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
      if params[:user_id].present?
        @taskperformance = Taskperformance.find_by(user_id: params[:user_id])
      else
        @taskperformance = Taskperformance.find(params[:id])
      end

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
