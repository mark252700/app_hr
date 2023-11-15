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
 # GET /oth_performeds/new
 def new
  if OthPerformed.exists?(user_id: current_user.id)
    redirect_to new_req_training_path
  else
    @oth_performed = OthPerformed.new

    @user = current_user

    # Retrieve the @other_positions
    @other_positions = OtherPosition.where(user_id: current_user.id)

    set_button_label('Next')
  end
end





 # GET /oth_performeds/1/edit
def edit
  @user_id = params[:user_id] || current_user.id
  @oth_performed = OthPerformed.find_by(user_id: @user_id)

  if @oth_performed.nil? || @oth_performed.blank?
    # Redirect to a new path (e.g., new_oth_performed_path)
    redirect_to new_oth_performed_path
  else
    @user = current_user
    set_button_label('Save')
    @other_positions = OtherPosition.where(user_id: current_user.id)

  end
end

  # POST /oth_performeds or /oth_performeds.json
  def create

    @user = current_user
    @oth_performed = OthPerformed.new(oth_performed_params)
    @oth_performed.user = current_user


    respond_to do |format|
      if @oth_performed.save
        format.html { redirect_to new_req_training_path }
        format.json { render :show, status: :created, location: @oth_performed }
      else
        # If validation fails, re-render the 'new' view without redirecting
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @oth_performed.errors, status: :unprocessable_entity }



      end
    end
  end

  # PATCH/PUT /oth_performeds/1 or /oth_performeds/1.json
  def update
    respond_to do |format|
      @other_positions = OtherPosition.all
      if @oth_performed.update(oth_performed_params)
        format.html { redirect_to edit_req_training_path(user_id: @oth_performed.user_id) }
        format.json { render :show, status: :ok, location: @oth_performed }
      else
        # If validation fails, re-render the 'edit' view without redirecting
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

# Custom Delete for oth_position

 # Custom destroy action for OtherPosition
 def custom_destroy
  @other_position = OtherPosition.find(params[:id])


  # Perform the deletion
  @other_position.destroy

  respond_to do |format|
    format.html { redirect_to new_oth_performed_path }
    format.json { head :no_content }
  end
end


  private

  def set_button_label(label)
    @button_label = label
  end

  def set_oth_performed
    if params[:user_id].present?
      @oth_performed = OthPerformed.find_by(user_id: params[:user_id], id: params[:id])
    else
      @oth_performed = OthPerformed.find(params[:id])
    end


  end
end

    # Only allow a list of trusted parameters through.
    def oth_performed_params
      params.permit(:job_performed, :job_done, :job_hr, :job_min, :integer, :job_current, :job_reason)
    end
