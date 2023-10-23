class OthCompetenciesController < ApplicationController
  before_action :set_oth_competency, only: %i[ show edit update destroy ]

  # GET /oth_competencies or /oth_competencies.json
  def index
    @oth_competencies = OthCompetency.all
  end

  # GET /oth_competencies/1 or /oth_competencies/1.json
  def show
  end

  # GET /oth_competencies/new
  def new
    @oth_competency = OthCompetency.new
  end

  # GET /oth_competencies/1/edit
  def edit
  end

  # POST /oth_competencies or /oth_competencies.json
  def create
    @oth_competency = OthCompetency.new(oth_competency_params)

    respond_to do |format|
      if @oth_competency.save
        format.html { redirect_to oth_competency_url(@oth_competency), notice: "Oth competency was successfully created." }
        format.json { render :show, status: :created, location: @oth_competency }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @oth_competency.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /oth_competencies/1 or /oth_competencies/1.json
  def update
    respond_to do |format|
      if @oth_competency.update(oth_competency_params)
        format.html { redirect_to oth_competency_url(@oth_competency), notice: "Oth competency was successfully updated." }
        format.json { render :show, status: :ok, location: @oth_competency }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @oth_competency.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /oth_competencies/1 or /oth_competencies/1.json
  def destroy
    @oth_competency.destroy

    respond_to do |format|
      format.html { redirect_to oth_competencies_url, notice: "Oth competency was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_oth_competency
      @oth_competency = OthCompetency.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def oth_competency_params
      params.require(:oth_competency).permit(:competency)
    end
end
