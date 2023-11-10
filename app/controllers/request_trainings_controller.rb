class RequestTrainingsController < ApplicationController
  before_action :set_request_training, only: %i[ show edit update destroy ]

  # GET /request_trainings or /request_trainings.json
  def index
    @request_trainings = RequestTraining.all
  end

  # GET /request_trainings/1 or /request_trainings/1.json
  def show
  end

  # GET /request_trainings/new
  def new
    @request_training = RequestTraining.new
  end

  # GET /request_trainings/1/edit
  def edit
  end

  # POST /request_trainings or /request_trainings.json
  def create
    @request_training = RequestTraining.new(request_training_params)

    respond_to do |format|
      if @request_training.save
        format.html { redirect_to request_training_url(@request_training), notice: "Request training was successfully created." }
        format.json { render :show, status: :created, location: @request_training }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @request_training.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /request_trainings/1 or /request_trainings/1.json
  def update
    respond_to do |format|
      if @request_training.update(request_training_params)
        format.html { redirect_to request_training_url(@request_training), notice: "Request training was successfully updated." }
        format.json { render :show, status: :ok, location: @request_training }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @request_training.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /request_trainings/1 or /request_trainings/1.json
  def destroy
    @request_training.destroy

    respond_to do |format|
      format.html { redirect_to request_trainings_url, notice: "Request training was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_request_training
      @request_training = RequestTraining.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def request_training_params
      params.require(:request_training).permit(:train_type, :train_benefit)
    end
end
