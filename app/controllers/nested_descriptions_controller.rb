class NestedDescriptionsController < ApplicationController
  before_action :set_nested_description, only: %i[ show edit update destroy ]

  # GET /nested_descriptions or /nested_descriptions.json
  def index
    @nested_descriptions = NestedDescription.all
  end

  # GET /nested_descriptions/1 or /nested_descriptions/1.json
  def show
  end

  # GET /nested_descriptions/new
  def new
    @nested_description = NestedDescription.new
  end

  # GET /nested_descriptions/1/edit
  def edit
  end

  # POST /nested_descriptions or /nested_descriptions.json
  def create
    @nested_description = NestedDescription.new(nested_description_params)

    respond_to do |format|
      if @nested_description.save
        format.html { redirect_to nested_description_url(@nested_description), notice: "Nested description was successfully created." }
        format.json { render :show, status: :created, location: @nested_description }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @nested_description.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /nested_descriptions/1 or /nested_descriptions/1.json
  def update
    respond_to do |format|
      if @nested_description.update(nested_description_params)
        format.html { redirect_to nested_description_url(@nested_description), notice: "Nested description was successfully updated." }
        format.json { render :show, status: :ok, location: @nested_description }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @nested_description.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /nested_descriptions/1 or /nested_descriptions/1.json
  def destroy
    @nested_description.destroy

    respond_to do |format|
      format.html { redirect_to nested_descriptions_url, notice: "Nested description was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_nested_description
      @nested_description = NestedDescription.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def nested_description_params
      params.require(:nested_description).permit(:description)
    end
end
