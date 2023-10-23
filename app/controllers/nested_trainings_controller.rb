class NestedTrainingsController < ApplicationController
  before_action :set_nested_training, only: %i[ show edit update destroy ]

  # GET /nested_trainings or /nested_trainings.json
  def index
    @nested_trainings = NestedTraining.all
  end

  # GET /nested_trainings/1 or /nested_trainings/1.json
  def show
  end

  # GET /nested_trainings/new
  def new
    @nested_training = NestedTraining.new
  end

  # GET /nested_trainings/1/edit
  def edit
  end

  # POST /nested_trainings or /nested_trainings.json
  def create
    @nested_training = NestedTraining.new(nested_training_params)

    respond_to do |format|
      if @nested_training.save
        format.html { redirect_to nested_training_url(@nested_training), notice: "Nested training was successfully created." }
        format.json { render :show, status: :created, location: @nested_training }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @nested_training.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /nested_trainings/1 or /nested_trainings/1.json
  def update
    respond_to do |format|
      if @nested_training.update(nested_training_params)
        format.html { redirect_to nested_training_url(@nested_training), notice: "Nested training was successfully updated." }
        format.json { render :show, status: :ok, location: @nested_training }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @nested_training.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /nested_trainings/1 or /nested_trainings/1.json
  def destroy
    @nested_training.destroy

    respond_to do |format|
      format.html { redirect_to nested_trainings_url, notice: "Nested training was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_nested_training
      @nested_training = NestedTraining.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def nested_training_params
      params.require(:nested_training).permit(:train_type, :train_benefit, :sup_name, :sup_title)
    end
end
