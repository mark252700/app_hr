  class AdminController < ApplicationController
    def index
      @users = User.includes(:emp_detail).all
      @users = User.paginate(page: params[:page], per_page: 5)
    end

    def approve_user
      @user = User.find(params[:id])
      @user.update(approved: true)
      flash[:success] = "User has been approved."
      redirect_to admin_index_path
    end

    def destroy_data
      @user = User.find(params[:id])
      if @user.destroy
        flash[:success] = "User has been successfully deleted."
      else
        flash[:error] = "Failed to delete the user."
      end

      # Destroy associated records
      @user.jb_description.destroy if @user.jb_description
      @user.emp_detail.destroy if @user.emp_detail
      @user.taskperformance.destroy if @user.taskperformance
      @user.oth_performed.destroy if @user.oth_performed
      @user.req_training.destroy if @user.req_training

      redirect_to admin_index_path
    end

    def search
      search_query = params[:query]
      @users = User.where("email LIKE ?", "%#{search_query}%").paginate(page: params[:page], per_page: 10)

      respond_to do |format|
        format.js # Create a search.js.erb file for the response
      end
    end




    def generate_pdf
      @user = User.find(params[:id])

      # Employee details
      @emp_detail = @user.emp_detail
      @benefits = @user.emp_detail&.benefits

      # Job Description
      @jb_description = @user.jb_description
      @jb_performeds = @user.jb_description&.jb_performeds

      # Task performance
      @taskperformance = @user.taskperformance
      @oth_performed = @user.oth_performed

      # Other position handle
      @oth_position = @user.oth_performed&.oth_position
      @nested_othperformes = @user.oth_performed&.nested_othperformes
      @other_tasks = @user.oth_performed&.other_tasks
      @other_competencies = @user.oth_performed&.other_competencies

      # Required training
      @req_training = @user.req_training
      @nested_trainings = @user.req_training&.nested_trainings
      @rel_trainings = @user.req_training&.rel_trainings
      @notrel_trainings = @user.req_training&.notrel_trainings

      @competencies = @user.taskperformance&.competencies

      other_competencies_list = @other_competencies.map(&:competencies).join(', ')
      competencies_list = @competencies.map(&:competencies).join(', ')
      benefits_list = @benefits.map(&:benefit).join(', ')

      pdf = Prawn::Document.new

      # Set font and font size
      pdf.font "Helvetica", size: 12

  # Add the header with logo, address, and contact
  pdf.bounding_box([0, pdf.bounds.top - 5], width: pdf.bounds.width) do
    pdf.image("#{Rails.root}/app/assets/images/logo.png", width: 100, position: :center)
    pdf.move_down(10)
    pdf.text "1CISP Bldg., #11 Mapagbigay cor. Maunlad Sts., Brgy. Pinyahan, Diliman, Quezon City", align: :center, size: 9
    pdf.text "Contact: (02) 8 556 2700", align: :center, size: 9
  end

    pdf.move_down(20)

      # Title
      pdf.bounding_box([0, pdf.cursor], width: pdf.bounds.width) do
        pdf.text "Employee Details", size: 16, style: :bold, align: :left
        pdf.move_down 10
      end

      pdf.bounding_box([0, pdf.cursor], width: pdf.bounds.width) do
        pdf.table([["Full Name:", "#{@emp_detail.firstname} #{@emp_detail.middlename} #{@emp_detail.lastname}".upcase, "Position Title:", @emp_detail.pos_title&.upcase],
                   ["Employee ID:", @emp_detail.emp_id, "Years in Service:", "Years: #{@emp_detail.ser_year}, Month: #{@emp_detail.ser_month}"],
                   ["Email:", @user.email.upcase, "Mobile No.:", @emp_detail.contact],
                   ["Division:", @emp_detail.division&.upcase, "Department:", @emp_detail.department&.upcase],
                   ["Supervisor Name:", @emp_detail.sup_name&.upcase, "Supervisor Title:", @emp_detail.sup_title&.upcase]],
                  cell_style: { border_width: 0.5, padding: [5, 10] })
      end

      # Add a line break
      pdf.move_down(20)

      # Title
      pdf.bounding_box([0, pdf.cursor], width: pdf.bounds.width) do
        pdf.text "Educational Attainment", size: 16, style: :bold, align: :left
        pdf.move_down 10
      end

      pdf.table([["Course:", @emp_detail.educ_course.to_s.upcase, "Year Graduated:", @emp_detail.educ_grad&.strftime('%b %d %Y')],
        ["Skills:", @emp_detail.educ_skill.to_s.upcase, "Certificate:", @emp_detail.educ_certificate.to_s.upcase],
        ["Other Skills:", @emp_detail.educ_othskill.to_s.upcase]],
      cell_style: { border_width: 0.5, padding: [5, 10] })

      # Add a line break
      pdf.move_down(20)

       # Title
       pdf.bounding_box([0, pdf.cursor], width: pdf.bounds.width) do
        pdf.text "Position Details", size: 16, style: :bold, align: :left
        pdf.move_down 10
      end

      pdf.table([["Work Hour Perday:", @emp_detail.hr_perday.to_s, "Work Hour perweek:", @emp_detail.hr_perweek.to_s, "Work Hour perweek:", @emp_detail.workday.to_s],
      ["Overtime Weekday:", @emp_detail.ot_weekday ? 'Yes' : 'No', "Overtime Weekend:", @emp_detail.ot_weekend ? 'Yes' : 'No', "Benefits", benefits_list],
      ["Breaktime:", @emp_detail.break, "Lunch:", @emp_detail.launch.to_s]],
      cell_style: { border_width: 0.5, padding: [5, 10] })

      # Add a line break
      pdf.move_down(20)

        # Footer
        pdf.text "Generated on: #{Time.now}", size: 8, align: :right

      # Start a new page
      pdf.start_new_page

      # Add the header with logo, address, and contact
  pdf.bounding_box([0, pdf.bounds.top - 5], width: pdf.bounds.width) do
    pdf.image("#{Rails.root}/app/assets/images/logo.png", width: 100, position: :center)
    pdf.move_down(10)
    pdf.text "1CISP Bldg., #11 Mapagbigay cor. Maunlad Sts., Brgy. Pinyahan, Diliman, Quezon City", align: :center, size: 9
    pdf.text "Contact: (02) 8 556 2700", align: :center, size: 9
  end

    pdf.move_down(20)

       # Title
       pdf.bounding_box([0, pdf.cursor], width: pdf.bounds.width) do
        pdf.text "Job Description", size: 16, style: :bold, align: :left
        pdf.move_down 10
      end

      pdf.table([["Description:", @jb_description.description.to_s]],
        cell_style: { border_width: 0.5, padding: [5, 10] })

        # Add a line break
        pdf.move_down(20)

        # Title
  pdf.bounding_box([0, pdf.cursor], width: pdf.bounds.width) do
    pdf.text "Job Performed", size: 16, style: :bold, align: :left
    pdf.move_down 10
  end

  # Create a table for Job Performed
  pdf.table([
    ["Job Performed", "Whenever this work done", "Time alloted for this job", "Is this within your current job description", "Reasons for doing this task"]
  ] + @jb_description.jb_performeds.map do |jb_performed|
    [
      jb_performed.job_performed.upcase,
      jb_performed.job_done.upcase,
      "#{jb_performed.job_hr} hour/s #{jb_performed.job_min} mins",
      jb_performed.job_current ? 'Yes' : 'No',
      jb_performed.job_reason
    ]
  end, header: true, cell_style: { border_width: 0.5, padding: [5, 5] })

   # Add a line break
   pdf.move_down(20)

  pdf.bounding_box([0, pdf.cursor], width: pdf.bounds.width) do
    pdf.text "TaskPerformance", size: 16, style: :bold, align: :left
    pdf.move_down 10
  end

  pdf.table([
    ["ask that are not done", "Reasons for not doing the task", "Impact of not doing the task'"]
  ] + [
    [
      @taskperformance.task_notdone.upcase,
      @taskperformance.task_reason.upcase,
      @taskperformance.task_impact.upcase
    ]
  ] + @taskperformance.nested_taskperfomances.map do |task|
    [
      task.task_notdone.upcase,
      task.task_reason.upcase,
      task.task_impact.upcase
    ]
  end, header: true, cell_style: { border_width: 0.5, padding: [5, 5] })

   # Add a line break
   pdf.move_down(20)

  pdf.table([["Required Competencies", competencies_list]],
    cell_style: { border_width: 0.5, padding: [5, 10] })

  # Add a line break
  pdf.move_down(20)

  pdf.bounding_box([0, pdf.cursor], width: pdf.bounds.width) do
    pdf.text "Other position handle", size: 16, style: :bold, align: :left
    pdf.move_down 10
  end

  pdf.table([["Position:", @oth_positions&.pos_title.to_s.upcase, "Years: #{@oth_positions&.pos_year}, Month: #{@oth_positions&.pos_month}"]],
    cell_style: { border_width: 0.5, padding: [5, 10] })

     # Add a line break
     pdf.move_down(20)


    pdf.table([["Required Competencies", other_competencies_list]],
      cell_style: { border_width: 0.5, padding: [5, 10] })

    # Add a line break
    pdf.move_down(20)

     # Footer
     pdf.text "Generated on: #{Time.now}", size: 8, align: :right

    pdf.start_new_page

    # Add the header with logo, address, and contact
  pdf.bounding_box([0, pdf.bounds.top - 5], width: pdf.bounds.width) do
    pdf.image("#{Rails.root}/app/assets/images/logo.png", width: 100, position: :center)
    pdf.move_down(10)
    pdf.text "1CISP Bldg., #11 Mapagbigay cor. Maunlad Sts., Brgy. Pinyahan, Diliman, Quezon City", align: :center, size: 9
    pdf.text "Contact: (02) 8 556 2700", align: :center, size: 9
  end

  # Add a line break
  pdf.move_down(20)

    # Create a table for Job Performed
  pdf.table([
    ["Job Performed", "Whenever this work done", "Time alloted for this job", "Is this within your current job description", "Reasons for doing this task"]
  ]+ [[
    @oth_performed.job_performed.upcase,
    @oth_performed.job_done.upcase,
      "#{@oth_performed.job_hr} hour/s #{@oth_performed.job_min} mins",
      @oth_performed.job_current ? 'Yes' : 'No',
      @oth_performed.job_reason
  ]]+ @oth_performed.nested_othperformes.map do |nested_performed|
    [
      nested_performed.job_performed.upcase,
      nested_performed.job_done.upcase,
      "#{nested_performed.job_hr} hour/s #{nested_performed.job_min} mins",
      nested_performed.job_current ? 'Yes' : 'No',
      nested_performed.job_reason
    ]
  end, header: true, cell_style: { border_width: 0.5, padding: [5, 5] })

   # Add a line break
   pdf.move_down(20)

  pdf.bounding_box([0, pdf.cursor], width: pdf.bounds.width) do
    pdf.text "Required Training for the Position", size: 16, style: :bold, align: :left
    pdf.move_down 10
  end

     # Create a table for Job Performed
  pdf.table([
    ["Type of Training", "	Benefits of training in your current role"]
  ]+ [[
      @req_training.train_type.upcase,
      @req_training.train_benefit.upcase

  ]]+ @req_training.nested_trainings.map do |nested_traning|
    [
      nested_traning.train_type.upcase,
      nested_traning.train_benefit.upcase
    ]
  end, header: true, cell_style: { border_width: 0.5, padding: [5, 5] })

  # Add a line break
  pdf.move_down(20)

  pdf.bounding_box([0, pdf.cursor], width: pdf.bounds.width) do
    pdf.text "Previous Trainings Related to the Job Role", size: 16, style: :bold, align: :left
    pdf.move_down 10
  end

  pdf.table([
    ["Type of Training", "Benefits of training in your current role"]
  ] + @rel_trainings.map do |rel|
    [
      rel&.train_type&.upcase,
      rel&.train_benefit&.upcase
    ]
  end, header: true, cell_style: { border_width: 0.5, padding: [5, 5] })


  pdf.move_down(20)

  pdf.bounding_box([0, pdf.cursor], width: pdf.bounds.width) do
    pdf.text "Previous Trainings Not Related to the Job Role", size: 16, style: :bold, align: :left
    pdf.move_down 10
  end

  pdf.table([
    ["Type of Training", "Benefits of training in your current role"]
  ] + @notrel_trainings.map do |training|
    [
      training&.train_type&.upcase,
      training&.train_benefit&.upcase
    ]
  end, header: true, cell_style: { border_width: 0.5, padding: [5, 5] })

  pdf.move_down(20)

  pdf.bounding_box([0, pdf.cursor], width: pdf.bounds.width) do
    pdf.text "Immidiate Superior", size: 16, style: :bold, align: :left
    pdf.move_down 10
  end

  pdf.table([
    ["Name", "Title"]
  ]+ [[
      @req_training.sup_name.upcase,
      @req_training.sup_title.upcase

  ]]+ @req_training.nested_trainings.map do |nested_traning|
    [
      nested_traning.sup_name.upcase,
      nested_traning.sup_title.upcase
    ]
  end, header: true, cell_style: { border_width: 0.5, padding: [5, 5] })

  pdf.move_down(20)

      # Footer
      pdf.text "Generated on: #{Time.now}", size: 8, align: :right

      send_data(pdf.render, filename: 'employee.pdf', type: 'application/pdf', disposition: 'inline')
    end

  end
