class OtherCompetencesController < ApplicationController
  before_action :set_other_competence, only: %i[ show edit update destroy ]

  # GET /other_competences or /other_competences.json
  def index
    @other_competences = OtherCompetence.all
  end

  # GET /other_competences/1 or /other_competences/1.json
  def show
  end

  # GET /other_competences/new
  def new
    @other_competence = OtherCompetence.new
  end

  # GET /other_competences/1/edit
  def edit
  end

  # POST /other_competences or /other_competences.json
  def create
    @other_competence = OtherCompetence.new(other_competence_params)

    respond_to do |format|
      if @other_competence.save
        format.html { redirect_to other_competence_url(@other_competence), notice: "Other competence was successfully created." }
        format.json { render :show, status: :created, location: @other_competence }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @other_competence.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /other_competences/1 or /other_competences/1.json
  def update
    respond_to do |format|
      if @other_competence.update(other_competence_params)
        format.html { redirect_to other_competence_url(@other_competence), notice: "Other competence was successfully updated." }
        format.json { render :show, status: :ok, location: @other_competence }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @other_competence.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /other_competences/1 or /other_competences/1.json
  def destroy
    @other_competence.destroy

    respond_to do |format|
      format.html { redirect_to other_competences_url, notice: "Other competence was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_other_competence
      @other_competence = OtherCompetence.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def other_competence_params
      params.require(:other_competence).permit(:competencies)
    end
end
