class NotrelTrainingsController < ApplicationController
  before_action :set_notrel_training, only: %i[ show edit update destroy ]

  # GET /notrel_trainings or /notrel_trainings.json
  def index
    @notrel_trainings = NotrelTraining.all
  end

  # GET /notrel_trainings/1 or /notrel_trainings/1.json
  def show
  end

  # GET /notrel_trainings/new
  def new
    @notrel_training = NotrelTraining.new
  end

  # GET /notrel_trainings/1/edit
  def edit
  end

  # POST /notrel_trainings or /notrel_trainings.json
  def create
    @notrel_training = NotrelTraining.new(notrel_training_params)

    respond_to do |format|
      if @notrel_training.save
        format.html { redirect_to notrel_training_url(@notrel_training), notice: "Notrel training was successfully created." }
        format.json { render :show, status: :created, location: @notrel_training }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @notrel_training.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /notrel_trainings/1 or /notrel_trainings/1.json
  def update
    respond_to do |format|
      if @notrel_training.update(notrel_training_params)
        format.html { redirect_to notrel_training_url(@notrel_training), notice: "Notrel training was successfully updated." }
        format.json { render :show, status: :ok, location: @notrel_training }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @notrel_training.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /notrel_trainings/1 or /notrel_trainings/1.json
  def destroy
    @notrel_training.destroy

    respond_to do |format|
      format.html { redirect_to notrel_trainings_url, notice: "Notrel training was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_notrel_training
      @notrel_training = NotrelTraining.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def notrel_training_params
      params.require(:notrel_training).permit(:train_type, :train_benefit)
    end
end
