class JbPerformedsController < ApplicationController
  before_action :set_jb_performed, only: %i[ show edit update destroy ]

  # GET /jb_performeds or /jb_performeds.json
  def index
    @jb_performeds = JbPerformed.all
  end

  # GET /jb_performeds/1 or /jb_performeds/1.json
  def show
  end

  # GET /jb_performeds/new
  def new
    @jb_performed = JbPerformed.new
  end

  # GET /jb_performeds/1/edit
  def edit

  end

  # POST /jb_performeds or /jb_performeds.json
  def create
    @jb_performed = JbPerformed.new(jb_performed_params)

    respond_to do |format|
      if @jb_performed.save
        format.html { redirect_to jb_performed_url(@jb_performed), notice: "Jb performed was successfully created." }
        format.json { render :show, status: :created, location: @jb_performed }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @jb_performed.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /jb_performeds/1 or /jb_performeds/1.json
  def update
    respond_to do |format|
      if @jb_performed.update(jb_performed_params)
        format.html { redirect_to jb_performed_url(@jb_performed), notice: "Jb performed was successfully updated." }
        format.json { render :show, status: :ok, location: @jb_performed }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @jb_performed.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /jb_performeds/1 or /jb_performeds/1.json
  def destroy
    @jb_performed.destroy

    respond_to do |format|
      format.html { redirect_to jb_performeds_url, notice: "Jb performed was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_jb_performed
      @jb_performed = JbPerformed.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def jb_performed_params
      params.require(:jb_performed).permit(:job_performed, :job_done, :job_hr, :job_min, :job_current, :job_reason)
    end
end
