class JbDescriptionsController < ApplicationController
  before_action :set_jb_description, only: %i[ show edit update destroy ]


  # GET /jb_descriptions or /jb_descriptions.json
  def index
    @jb_descriptions = JbDescription.all
  end

  # GET /jb_descriptions/1 or /jb_descriptions/1.json
  def show
  end

  # GET /jb_descriptions/new
  def new
    set_button_label('next')
    if JbDescription.exists?(user_id: current_user.id)
      redirect_to new_taskperformance_path

    else
       @jb_description = JbDescription.new
       @jb_description.jb_performeds.build
    end


  end

# Assuming you have a JbDescription model with belongs_to association to User
def edit
  @user_id = params[:user_id] || current_user.id
  @jb_description = JbDescription.find_by(user_id: @user_id)

  if @jb_description.blank?
    redirect_to new_jb_description_path(user_id: @user_id)
  else
    @jb_description.jb_performeds.build if @jb_description.jb_performeds.empty?
    set_button_label('Save')
  end
end

  # POST /jb_descriptions or /jb_descriptions.json
  def create
    @jb_description = JbDescription.new(jb_description_params) # Change this line

    @jb_description.user = current_user

    respond_to do |format|
      if @jb_description.save
        format.html { redirect_to new_taskperformance_path }
        format.json { render :show, status: :created, location: @jb_description }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @jb_description.errors, status: :unprocessable_entity }
        @jb_description.jb_performeds.build if @jb_description.jb_performeds.empty?
        puts "Error: #{@jb_description.errors.full_messages}" # Change this line
        set_button_label('next')
      end
    end
  end

  def update
    respond_to do |format|
      if @jb_description.update(jb_description_params)
        user_id = params[:user_id] || current_user.id

        if Taskperformance.exists?(user_id: user_id)
          format.html { redirect_to edit_taskperformance_path(user_id: user_id) }
        else
          format.html { redirect_to new_taskperformance_path(user_id: user_id) }
        end

        format.json { render :show, status: :ok, location: @jb_description }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @jb_description.errors, status: :unprocessable_entity }
      end
    end
  end


  # DELETE /jb_descriptions/1 or /jb_descriptions/1.json
  def destroy
    @jb_description.destroy

    respond_to do |format|
      format.html { redirect_to jb_descriptions_url, notice: "Jb description was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def set_button_label(label)
    @button_label = label
  end

  def set_jb_description
    @jb_description = JbDescription.find_by(id: params[:id])

    if @jb_description.nil?
      redirect_to new_jb_description_path
    end
  end


    def jb_description_params
      params.require(:jb_description).permit(
      :description,
       jb_performeds_attributes: [:id,:job_performed, :job_done, :job_hr, :job_min, :job_current, :job_reason, :_destroy],
      nested_descriptions_attributes: [:id, :description, :_destroy])
    end


end
