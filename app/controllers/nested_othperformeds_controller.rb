class NestedOthperformedsController < ApplicationController
  before_action :set_nested_othperformed, only: %i[ show edit update destroy ]

  # GET /nested_othperformeds or /nested_othperformeds.json
  def index
    @nested_othperformeds = NestedOthperformed.all
  end

  # GET /nested_othperformeds/1 or /nested_othperformeds/1.json
  def show
  end

  # GET /nested_othperformeds/new
  def new
    @nested_othperformed = NestedOthperformed.new
  end

  # GET /nested_othperformeds/1/edit
  def edit
  end

  # POST /nested_othperformeds or /nested_othperformeds.json
  def create
    @nested_othperformed = NestedOthperformed.new(nested_othperformed_params)

    respond_to do |format|
      if @nested_othperformed.save
        format.html { redirect_to nested_othperformed_url(@nested_othperformed), notice: "Nested othperformed was successfully created." }
        format.json { render :show, status: :created, location: @nested_othperformed }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @nested_othperformed.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /nested_othperformeds/1 or /nested_othperformeds/1.json
  def update
    respond_to do |format|
      if @nested_othperformed.update(nested_othperformed_params)
        format.html { redirect_to nested_othperformed_url(@nested_othperformed), notice: "Nested othperformed was successfully updated." }
        format.json { render :show, status: :ok, location: @nested_othperformed }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @nested_othperformed.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /nested_othperformeds/1 or /nested_othperformeds/1.json
  def destroy
    @nested_othperformed.destroy

    respond_to do |format|
      format.html { redirect_to nested_othperformeds_url, notice: "Nested othperformed was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_nested_othperformed
      @nested_othperformed = NestedOthperformed.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def nested_othperformed_params
      params.require(:nested_othperformed).permit(:job_performed, :job_done, :job_hr, :job_min, :job_current, :job_reason)
    end
end
