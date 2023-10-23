class OthPositionsController < ApplicationController
  before_action :set_oth_position, only: %i[ show edit update destroy ]

  # GET /oth_positions or /oth_positions.json
  def index
    @oth_positions = OthPosition.all
  end

  # GET /oth_positions/1 or /oth_positions/1.json
  def show
  end

  # GET /oth_positions/new
  def new
    @oth_position = OthPosition.new
  end

  # GET /oth_positions/1/edit
  def edit
  end

  # POST /oth_positions or /oth_positions.json
  def create
    @oth_position = OthPosition.new(oth_position_params)

    respond_to do |format|
      if @oth_position.save
        format.html { redirect_to oth_position_url(@oth_position), notice: "Oth position was successfully created." }
        format.json { render :show, status: :created, location: @oth_position }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @oth_position.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /oth_positions/1 or /oth_positions/1.json
  def update
    respond_to do |format|
      if @oth_position.update(oth_position_params)
        format.html { redirect_to oth_position_url(@oth_position), notice: "Oth position was successfully updated." }
        format.json { render :show, status: :ok, location: @oth_position }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @oth_position.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /oth_positions/1 or /oth_positions/1.json
  def destroy
    @oth_position.destroy

    respond_to do |format|
      format.html { redirect_to oth_positions_url, notice: "Oth position was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_oth_position
      @oth_position = OthPosition.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def oth_position_params
      params.require(:oth_position).permit(:pos_title, :pos_yr, :pos_month)
    end
end
