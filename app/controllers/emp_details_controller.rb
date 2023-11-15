class EmpDetailsController < ApplicationController
  before_action :set_emp_detail, only: %i[ show edit update destroy ]

  # GET /emp_details or /emp_details.json
  def index
    @emp_details = EmpDetail.all
    # @emp_detail = EmpDetail.new(
    #   fullname:  FFaker::NamePH.name,
    #   emp_id:  FFaker::IdentificationESCL.luhn_number,
    #   rank: FFaker::Job.title,
    #   division: FFaker::Company.position,
    #   sup_name: FFaker::NamePH.name,
    #   pos_title: FFaker::Job.title,
    #   ser_year: rand(1..30),  # Random service years between 1 and 30
    #   ser_month: rand(1..12), # Random service months between 1 and 12
    #   educ_course: FFaker::Education.major,
    #   educ_grad: FFaker::Time.date,
    #   educ_skill: FFaker::Job.key_skill,
    #   educ_certificate: FFaker::Education.school,
    #   educ_othskill: FFaker::Job.key_skill,
    #   contact: FFaker::PhoneNumber.short_phone_number,
    #   department: FFaker::Company.position,
    #   sup_title: FFaker::Job.title,
    #   hr_perday: rand(4..12),   # Random work hours per day between 4 and 12
    #   hr_perweek: rand(20..60), # Random work hours per week between 20 and 60
    #   break: rand(15..60),      # Random break time in minutes between 15 and 60
    #   launch: FFaker::Time.datetime.strftime('%H:%M'),
    #   ot_weekday: [true, false].sample, # Random true or false for overtime on weekdays
    #   ot_weekend: [true, false].sample, # Random true or false for overtime on weekends
    #   workday: rand(1..5) # Random workdays between 1 and 5
    # )
   end

  # GET /emp_details/1 or /emp_details/1.json
  def show


  end

 # GET /emp_details/new
def new
  set_button_label('Next')
  self.action_name = 'new'

  if EmpDetail.exists?(user_id: current_user.id)
    redirect_to new_jb_description_path
  else
    @emp_detail = EmpDetail.new
    # Build an initial set of benefit fields
    @emp_detail.benefits.build
  end
end



  # GET /emp_details/1/edit
  def edit
    @emp_detail = EmpDetail.find_by(user_id: current_user.id)
    @emp_detail.benefits.build if @emp_detail.benefits.empty?
    set_button_label('Save')

  end

# POST /emp_details or /emp_details.json
def create
  @emp_detail = EmpDetail.new(emp_detail_params)
  @emp_detail.user = current_user # Assign the current user to the EmpDetail

  respond_to do |format|
    if @emp_detail.save
      format.html { redirect_to new_jb_description_path }
      format.json { render :show, status: :created, location: @emp_detail }
    else
      format.html { render :new, status: :unprocessable_entity }
      format.json { render json: @emp_detail.errors, status: :unprocessable_entity }
      @emp_detail.benefits.build if @emp_detail.benefits.empty?
      Rails.logger.error(@emp_detail.errors.full_messages)
      set_button_label('Next')
    end
  end
end


# PATCH/PUT /emp_details/1 or /emp_details/1.json
def update
  respond_to do |format|
    if @emp_detail.update(emp_detail_params)
      format.html { redirect_to edit_jb_description_path }
      format.json { render :show, status: :ok, location: @emp_detail }
    else
      if @emp_detail.errors.empty?
        # Redirect to new_jb_description_path if the update was successful but ID is nil
        format.html { redirect_to new_jb_description_path }
        format.json { render json: @emp_detail.errors, status: :unprocessable_entity }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @emp_detail.errors, status: :unprocessable_entity }
        @emp_detail.benefits.build if @emp_detail.benefits.empty?
        set_button_label('Save')
      end
    end
  end
end




  # DELETE /emp_details/1 or /emp_details/1.json
  def destroy
    @emp_detail.destroy

    respond_to do |format|
      format.html { redirect_to emp_details_url, notice: "Emp detail was successfully destroyed." }
      format.json { head :no_content }
    end
  end




  private
  def set_button_label(label)
      @button_label = label
    end


    # Use callbacks to share common setup or constraints between actions.
    def set_emp_detail
      @emp_detail = EmpDetail.find(params[:id])
      @emp_detail = EmpDetail.find_by(user_id: current_user.id)
    end

    # Only allow a list of trusted parameters through.
    def emp_detail_params
      params.require(:emp_detail).permit(
        :fullname, :emp_id, :rank, :division, :sup_name, :pos_title, :ser_year, :ser_month,
        :educ_course, :educ_grad, :educ_skill, :educ_certificate, :educ_othskill,
        :contact, :department, :sup_title, :hr_perday, :hr_perweek, :break, :launch,
        :ot_weekday, :ot_weekend, :workday,:firstname,:middlename,:lastname, :educ_undergrad,
        benefits_attributes: [:id, :benefit, :_destroy] # Include the benefit's ID
      )
    end
end
