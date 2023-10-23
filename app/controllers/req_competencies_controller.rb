class ReqCompetenciesController < ApplicationController
  before_action :set_req_competency, only: %i[ show edit update destroy ]

  # GET /req_competencies or /req_competencies.json
  def index
    @req_competencies = ReqCompetency.all
  end

  # GET /req_competencies/1 or /req_competencies/1.json
  def show
  end

  # GET /req_competencies/new
  def new
    @req_competency = ReqCompetency.new
  end

  # GET /req_competencies/1/edit
  def edit
  end

  # POST /req_competencies or /req_competencies.json
  def create
    @req_competency = ReqCompetency.new(req_competency_params)

    respond_to do |format|
      if @req_competency.save
        format.html { redirect_to final_step_index_path }
        format.json { render :show, status: :created, location: @req_competency }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @req_competency.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /req_competencies/1 or /req_competencies/1.json
  def update
    respond_to do |format|
      if @req_competency.update(req_competency_params)
        format.html { final_step_index_path }
        format.json { render :show, status: :ok, location: @req_competency }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @req_competency.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /req_competencies/1 or /req_competencies/1.json
  def destroy
    @req_competency.destroy

    respond_to do |format|
      format.html { redirect_to req_competencies_url, notice: "Req competency was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_req_competency
      @req_competency = ReqCompetency.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def req_competency_params
      params.require(:req_competency).permit(:competencies)
    end
end
