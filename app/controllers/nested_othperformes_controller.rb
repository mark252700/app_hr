class NestedOthperformesController < ApplicationController
  before_action :set_nested_othperforme, only: %i[ show edit update destroy ]

  # GET /nested_othperformes or /nested_othperformes.json
  def index
    @nested_othperformes = NestedOthperforme.all
  end

  # GET /nested_othperformes/1 or /nested_othperformes/1.json
  def show
  end

  # GET /nested_othperformes/new
  def new
    @nested_othperforme = NestedOthperforme.new
  end

  # GET /nested_othperformes/1/edit
  def edit
  end

  # POST /nested_othperformes or /nested_othperformes.json
  def create
    @nested_othperforme = NestedOthperforme.new(nested_othperforme_params)

    respond_to do |format|
      if @nested_othperforme.save
        format.html { redirect_to nested_othperforme_url(@nested_othperforme), notice: "Nested othperforme was successfully created." }
        format.json { render :show, status: :created, location: @nested_othperforme }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @nested_othperforme.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /nested_othperformes/1 or /nested_othperformes/1.json
  def update
    respond_to do |format|
      if @nested_othperforme.update(nested_othperforme_params)
        format.html { redirect_to nested_othperforme_url(@nested_othperforme), notice: "Nested othperforme was successfully updated." }
        format.json { render :show, status: :ok, location: @nested_othperforme }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @nested_othperforme.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /nested_othperformes/1 or /nested_othperformes/1.json
  def destroy
    @nested_othperforme.destroy

    respond_to do |format|
      format.html { redirect_to nested_othperformes_url, notice: "Nested othperforme was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_nested_othperforme
      @nested_othperforme = NestedOthperforme.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def nested_othperforme_params
      params.require(:nested_othperforme).permit(:job_performed, :job_done, :job_hr, :job_min, :job_current, :job_reason)
    end
end
