class OtherCompetenciesController < ApplicationController
  before_action :set_other_competency, only: %i[ show edit update destroy ]

  # GET /other_competencies or /other_competencies.json
  def index
    @other_competencies = OtherCompetency.all
  end

  # GET /other_competencies/1 or /other_competencies/1.json
  def show
  end

  # GET /other_competencies/new
  def new
    @other_competency = OtherCompetency.new
  end

  # GET /other_competencies/1/edit
  def edit
  end

  # POST /other_competencies or /other_competencies.json
  def create
    @other_competency = OtherCompetency.new(other_competency_params)

    respond_to do |format|
      if @other_competency.save
        format.html { redirect_to other_competency_url(@other_competency), notice: "Other competency was successfully created." }
        format.json { render :show, status: :created, location: @other_competency }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @other_competency.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /other_competencies/1 or /other_competencies/1.json
  def update
    respond_to do |format|
      if @other_competency.update(other_competency_params)
        format.html { redirect_to other_competency_url(@other_competency), notice: "Other competency was successfully updated." }
        format.json { render :show, status: :ok, location: @other_competency }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @other_competency.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /other_competencies/1 or /other_competencies/1.json
  def destroy
    @other_competency.destroy

    respond_to do |format|
      format.html { redirect_to other_competencies_url, notice: "Other competency was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_other_competency
      @other_competency = OtherCompetency.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def other_competency_params
      params.require(:other_competency).permit(:competencies)
    end
end
