class ReqTrainingsController < ApplicationController
  before_action :set_req_training, only: %i[ show edit update destroy ]


  # GET /req_trainings or /req_trainings.json
  def index
    @req_trainings = ReqTraining.all
  end

  # GET /req_trainings/1 or /req_trainings/1.json
  def show
  end

  # GET /req_trainings/new
  def new
    if ReqTraining.exists?(user_id: current_user.id)
      redirect_to final_step_index_path

    elsif current_user.submitted
        flash[:alert] = 'You have already submitted this form.'
        redirect_to home_index_path  # Replace with the path you want to redirect to

    else
      @req_training = ReqTraining.new
      @req_training.rel_trainings.build
      @req_training.notrel_trainings.build
      @req_training.request_trainings.build
    end

  end

  # GET /req_trainings/1/edit
  def edit
    @req_training = ReqTraining.find_by(user_id: current_user.id)

    if @req_training.blank?
      redirect_to new_req_training_path

    elsif current_user.submitted
      flash[:alert] = 'You have already submitted this form.'
      redirect_to home_index_path  # Replace with the path you want to redirect to
    end
  end

  # POST /req_trainings or /req_trainings.json
  def create
    @req_training = ReqTraining.new(req_training_params)
    @req_training.user = current_user
    respond_to do |format|
      if @req_training.save
        format.html { redirect_to final_step_index_path }
        format.json { render :show, status: :created, location: @req_training }

      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @req_training.errors, status: :unprocessable_entity }
        puts "Error: #{@req_training.errors.full_messages}" # Use the instance variable
        @req_training.rel_trainings.build if @req_training.rel_trainings.blank?
        @req_training.notrel_trainings.build if @req_training.notrel_trainings.blank?
        @req_training.request_trainings.build if @req_training.request_trainings.blank?
      end
    end
  end

  # PATCH/PUT /req_trainings/1 or /req_trainings/1.json
  def update
    respond_to do |format|
      if @req_training.update(req_training_params)
        format.html { redirect_to final_step_index_path }
        format.json { render :show, status: :ok, location: @req_training }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @req_training.errors, status: :unprocessable_entity }
        @req_training.rel_trainings.build if @req_training.rel_trainings.blank?
        @req_training.notrel_trainings.build if @req_training.notrel_trainings.blank?
        @req_training.request_trainings.build if @req_training.request_trainings.blank?
      end
    end
  end

  # DELETE /req_trainings/1 or /req_trainings/1.json
  def destroy
    @req_training.destroy

    respond_to do |format|
      format.html { redirect_to req_trainings_url, notice: "Req training was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_req_training
      if params[:id].nil?
        redirect_to new_req_training_path
      else
        @req_training = ReqTraining.find_by(id: params[:id])
        if @req_training.nil?
          redirect_to new_req_training_path
        end
      end
    end


    # Only allow a list of trusted parameters through.
    def req_training_params
      params.require(:req_training).permit(
        :train_type,
        :train_benefit,
        :sup_name,
        :sup_title,
        nested_trainings_attributes: [:id, :train_type, :train_benefit, :sup_name, :sup_title, :_destroy],
        rel_trainings_attributes: [:id, :train_type, :train_benefit, :_destroy],
        notrel_trainings_attributes: [:id, :train_type, :train_benefit, :_destroy],
        request_trainings_attributes: [:id, :train_type, :train_benefit, :_destroy]
      )
    end
end
