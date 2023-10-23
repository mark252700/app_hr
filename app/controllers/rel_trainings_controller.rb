class RelTrainingsController < ApplicationController
  before_action :set_rel_training, only: %i[ show edit update destroy ]

  # GET /rel_trainings or /rel_trainings.json
  def index
    @rel_trainings = RelTraining.all
  end

  # GET /rel_trainings/1 or /rel_trainings/1.json
  def show
  end

  # GET /rel_trainings/new
  def new
    @rel_training = RelTraining.new
  end

  # GET /rel_trainings/1/edit
  def edit
  end

  # POST /rel_trainings or /rel_trainings.json
  def create
    @rel_training = RelTraining.new(rel_training_params)

    respond_to do |format|
      if @rel_training.save
        format.html { redirect_to rel_training_url(@rel_training), notice: "Rel training was successfully created." }
        format.json { render :show, status: :created, location: @rel_training }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @rel_training.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rel_trainings/1 or /rel_trainings/1.json
  def update
    respond_to do |format|
      if @rel_training.update(rel_training_params)
        format.html { redirect_to rel_training_url(@rel_training), notice: "Rel training was successfully updated." }
        format.json { render :show, status: :ok, location: @rel_training }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @rel_training.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rel_trainings/1 or /rel_trainings/1.json
  def destroy
    @rel_training.destroy

    respond_to do |format|
      format.html { redirect_to rel_trainings_url, notice: "Rel training was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rel_training
      @rel_training = RelTraining.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def rel_training_params
      params.require(:rel_training).permit(:train_type, :train_benefit)
    end
end
