  class AdminController < ApplicationController
    before_action :require_admin
    before_action :authenticate_user!


    def index
      @users = User.includes(:emp_detail).all
    end

    def dashboard
      @users = User.includes(:emp_detail).all
      @submitted_users = User.includes(:emp_detail).where(submitted: true)
      @approved_users = User.includes(:emp_detail).where(approved: true)
      @non_client_users = User.where(role: false)
      @division_counts = EmpDetail.group(:division).count
  end

  def archieve
    @users = User.includes(:emp_detail).all
    @submitted_users = User.includes(:emp_detail).where(submitted: true)
    @approved_users = User.includes(:emp_detail).where(approved: true)
    @non_client_users = User.where(role: false)
end


  def approve_user
    @user = User.find(params[:id])

    if @user.update(approved: true)
      UserMailer.approval_notification(@user).deliver_now
      flash[:success] = "User has been approved, and an approval email has been sent."
    else
      flash[:error] = "Failed to approve the user."
    end

    redirect_to admin_index_path
  end

    def destroy_data
      @user = User.find(params[:id])
      if @user.destroy
        flash[:notice] = "User has been successfully deleted."
      else
        flash[:notice] = "Failed to delete the user."
      end

      # Destroy associated records
      @user.jb_description.destroy if @user.jb_description
      @user.emp_detail.destroy if @user.emp_detail
      @user.taskperformance.destroy if @user.taskperformance
      @user.oth_performed.destroy if @user.oth_performed
      @user.req_training.destroy if @user.req_training

      redirect_to admin_index_path
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
      @other_position = @user.other_positions

      # Required training
      @req_training = @user.req_training
      @nested_trainings = @user.req_training&.nested_trainings
      @rel_trainings = @user.req_training&.rel_trainings
      @notrel_trainings = @user.req_training&.notrel_trainings
      @request_trainings = @user.req_training&.request_trainings

      @competencies = @user.taskperformance&.competencies


      competencies_list = @competencies.map(&:competencies).join(', ')
      benefits_list = @benefits.map(&:benefit).join(', ')

      pdf = Prawn::Document.new

      # Set font and font size
      pdf.font "Helvetica", size: 9

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
    pdf.move_down 20
  end

  pdf.bounding_box([0, pdf.cursor], width: pdf.bounds.width) do
    pdf.table([["Full Name:", "#{@emp_detail.firstname} #{@emp_detail.middlename} #{@emp_detail.lastname}".upcase, "Position Title:", @emp_detail.pos_title&.upcase],
               ["Employee ID:", @emp_detail.emp_id, "Years in Service:", "Years: #{@emp_detail.ser_year}, Month: #{@emp_detail.ser_month}"],
               ["Email:", @user.email.upcase, "Mobile No.:", @emp_detail.contact],
               ["Division:", @emp_detail.division&.upcase, "Department:", @emp_detail.department&.upcase],
               ["Immediate Superior:", @emp_detail.sup_name&.upcase, "Immediate Superior Position:", @emp_detail.sup_title&.upcase]],
              cell_style: { border_width: 0, padding: [5, 10] }, # Set border_width to 0 for no borders
              width: pdf.bounds.width) # Set the width to match the PDF document's width
  end


      # Add a line break
      pdf.move_down(50)

  # Title
  pdf.bounding_box([0, pdf.cursor], width: pdf.bounds.width) do
    pdf.text "Educational Attainment", size: 16, style: :bold, align: :left
    pdf.move_down 20
  end

  pdf.bounding_box([0, pdf.cursor], width: pdf.bounds.width) do
    pdf.table([["Course:", @emp_detail.educ_course.to_s.upcase, "Year Graduated:", @emp_detail.educ_grad&.strftime('%b %d %Y')],
      ["Skills:", @emp_detail.educ_skill.to_s.upcase, "Undergraduated:", @emp_detail.educ_undergrad.to_s.upcase],
      ["Other Skills:", @emp_detail.educ_othskill.to_s.upcase]],
      cell_style: { border_width: 0, padding: [5, 10] },
      width: pdf.bounds.width) # Set the width to match the PDF document's width
  end

      # Add a line break
      pdf.move_down(50)

     # Title
  pdf.bounding_box([0, pdf.cursor], width: pdf.bounds.width) do
    pdf.text "Position Details (Current Position)", size: 16, style: :bold, align: :left
    pdf.move_down 20
  end

  pdf.bounding_box([0, pdf.cursor], width: pdf.bounds.width) do
    pdf.table([["Work Hour Perday:", @emp_detail.hr_perday.to_s, "Work Hour perweek:", @emp_detail.hr_perweek.to_s, "Work Hour perweek:", @emp_detail.workday.to_s],
      ["Overtime Weekday:", @emp_detail.ot_weekday ? 'Yes' : 'No', "Overtime Weekend:", @emp_detail.ot_weekend ? 'Yes' : 'No', "Benefits", benefits_list],
      ["Breaktime:", @emp_detail.break, "Lunch:", @emp_detail.launch.to_s]],
      cell_style: { border_width: 0, padding: [5, 10] },
      width: pdf.bounds.width) # Set the width to match the PDF document's width
  end

      # Add a line break
      pdf.move_down(100)

        # Footer
        pdf.text "Generated on: #{Time.now}", size: 8, align: :right

      # Start a new page
      pdf.start_new_page

  #Jb descripton and Task Performance

      # Add the header with logo, address, and contact
  pdf.bounding_box([0, pdf.bounds.top - 5], width: pdf.bounds.width) do
    pdf.image("#{Rails.root}/app/assets/images/logo.png", width: 100, position: :center)
    pdf.move_down(10)
    pdf.text "1CISP Bldg., #11 Mapagbigay cor. Maunlad Sts., Brgy. Pinyahan, Diliman, Quezon City", align: :center, size: 9
    pdf.text "Contact: (02) 8 556 2700", align: :center, size: 9
  end

    pdf.move_down(20)

      # Title and section header
  pdf.bounding_box([0, pdf.cursor], width: pdf.bounds.width) do
    pdf.text "Job Description", size: 16, style: :bold, align: :left
    pdf.move_down 20
  end

  # Create an array to store all descriptions (main and nested)
  all_descriptions = []

  # Add the main description
  main_description = @jb_description.description.to_s
  all_descriptions << main_description

  # Add the nested descriptions if they exist
  if @jb_description.nested_descriptions.present?
    nested_descriptions = @jb_description.nested_descriptions.map(&:description)
    all_descriptions.concat(nested_descriptions)
  end

  # Create a table for all descriptions
  pdf.bounding_box([0, pdf.cursor], width: pdf.bounds.width) do
    pdf.table(all_descriptions.map { |description| [description] },
      cell_style: { border_width: 0, padding: [5, 10] }, # Set border_width to 0 for no borders
      width: pdf.bounds.width) # Set the width to match the PDF document's width
  end


  # Add a line break
  pdf.move_down(40)

        # Title
  pdf.bounding_box([0, pdf.cursor], width: pdf.bounds.width) do
    pdf.text "Job Performed", size: 16, style: :bold, align: :left
    pdf.move_down 20
  end

  # Create a table for Job Performed
  pdf.table([
    ["Job Performed", "How often do you perform this task?", "Time alloted for this job", "Is this within your current job description?", "Reasons for doing this task"]
  ] + @jb_description.jb_performeds.map do |jb_performed|
    [
      jb_performed.job_performed.upcase,
      jb_performed.job_done.upcase,
      "#{jb_performed.job_hr} hour/s #{jb_performed.job_min} mins",
      jb_performed.job_current ? 'Yes' : 'No',
      jb_performed.job_reason
    ]
  end, header: true, cell_style: { border_width: 0, padding: [5, 5] })

   # Add a line break
   pdf.move_down(40)

  pdf.bounding_box([0, pdf.cursor], width: pdf.bounds.width) do
    pdf.text "Task Performance", size: 16, style: :bold, align: :left
    pdf.move_down 20
  end

  pdf.table([
    ["Task that are not done", "Reasons for not doing the task", "Impact of not doing the task"]
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
  end, header: true, cell_style: { border_width: 0, padding: [5, 5] }, width: pdf.bounds.width)

   # Add a line break
   pdf.move_down(50)


   pdf.bounding_box([0, pdf.cursor], width: pdf.bounds.width) do
    pdf.text "Required Competencies", size: 16, style: :bold, align: :left
    pdf.move_down 20
  end

  pdf.table([[competencies_list]],
    cell_style: { border_width: 0, padding: [5, 10] })

  # Add a line break
  pdf.move_down(90)


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


    if @other_position.present? && @other_position.any?
      @other_position.each do |other_position|
        pdf.bounding_box([0, pdf.cursor], width: pdf.bounds.width) do
          pdf.text "Other Position - #{other_position.pos_title}", size: 16, style: :bold, align: :left
          pdf.move_down 10

          # Table for other_positions and other_performed
          pdf.table([
            ["Position Title", "Position Year", "Position Month", "Job Performed", "How often do you perform this task?", "Is this within your current job description?", "Job Current", "Job Reason"]
          ] + [
            [
              other_position.pos_title, other_position.pos_yr, other_position.pos_month, # These will be repeated for each row
              nil, nil, nil, nil, nil, nil # Empty placeholders for single row
            ]
          ] + other_position.other_perfromeds.map { |performed|
            [
              nil, nil, nil, # Empty placeholders for single row
              performed&.job_performed, performed&.job_done, "#{performed.job_hr} hour/s #{performed.job_min} mins",
              performed&.job_current ? 'Yes' : 'No', performed&.job_reason
            ]
          },
          cell_style: { border_width: 0, padding: [5, 10] })

          # Table for other_taskperformances
          pdf.table([
            ["Task that are not done", "Reasons for not doing the task", "Impact of not doing the task"]
          ] + other_position.other_taskperformances.map { |task_performance|
            [task_performance&.task_notdone, task_performance&.task_reason, task_performance&.task_impact]
          },
          cell_style: { border_width: 0, padding: [5, 10] })

          # Table for other_competences
          pdf.table([
            ["Competencies"]
          ] + other_position.other_competences.map { |competence|
            [competence&.competencies]
          },
          cell_style: { border_width: 0, padding: [5, 10] })
        end
      end
    else
      pdf.text "No data available", size: 12, style: :italic, align: :center
    end

     # Add a line break
     pdf.move_down(50)



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

  # Title and section header (for "Required Training for the Position")
  pdf.bounding_box([0, pdf.cursor], width: pdf.bounds.width) do
    pdf.text "Required Training for the Position", size: 16, style: :bold, align: :left
    pdf.move_down 20
  end

  # Create a table for "Required Training"
  pdf.table([
    ["Type of Training", "Benefits of training in your current role"]
  ] + [[
    @req_training.train_type.upcase,
    @req_training.train_benefit.upcase
  ]] + @req_training.nested_trainings.map do |nested_training|
    [
      nested_training.train_type.upcase,
      nested_training.train_benefit.upcase
    ]
  end, header: true, cell_style: { border_width: 0, padding: [5, 5] },
  width: pdf.bounds.width) # Set the width to match the PDF document's width

  pdf.move_down(40)

  # Title and section header (for "Previous Trainings Related to the Job Role")
  pdf.bounding_box([0, pdf.cursor], width: pdf.bounds.width) do
    pdf.text "Previous Trainings Related to the Job Role", size: 16, style: :bold, align: :left
    pdf.move_down 20
  end

  # Create a table for "Previous Trainings Related to the Job Role"
  pdf.table([
    ["Type of Training", "Benefits of training in your current role"]
  ] + @rel_trainings.map do |rel|
    [
      rel&.train_type&.upcase,
      rel&.train_benefit&.upcase
    ]
  end, header: true, cell_style: { border_width: 0, padding: [5, 5] },
  width: pdf.bounds.width) # Set the width to match the PDF document's width

  pdf.move_down(40)

  # Title and section header (for "Previous Trainings Not Related to the Job Role")
  pdf.bounding_box([0, pdf.cursor], width: pdf.bounds.width) do
    pdf.text "Previous Trainings Not Related to the Job Role", size: 16, style: :bold, align: :left
    pdf.move_down 20
  end

  # Create a table for "Previous Trainings Not Related to the Job Role"
  pdf.table([
    ["Type of Training", "Benefits of training in your current role"]
  ] + @notrel_trainings.map do |training|
    [
      training&.train_type&.upcase,
      training&.train_benefit&.upcase
    ]
  end, header: true, cell_style: { border_width: 0, padding: [5, 5] },
  width: pdf.bounds.width) # Set the width to match the PDF document's width

  pdf.move_down(40)

  # Title and section header (for "Requested Trainings")
  pdf.bounding_box([0, pdf.cursor], width: pdf.bounds.width) do
    pdf.text "Requested Trainings", size: 16, style: :bold, align: :left
    pdf.move_down 20
  end

  # Create a table for "Requested Trainings"
  pdf.table([
    ["Type of Training", "Benefits of training in your current role"]
  ] + @request_trainings.map do |training|
    [
      training&.train_type&.upcase,
      training&.train_benefit&.upcase
    ]
  end, header: true, cell_style: { border_width: 0, padding: [5, 5] },
  width: pdf.bounds.width) # Set the width to match the PDF document's width

  pdf.move_down(40)




      # Footer
      pdf.text "Generated on: #{Time.now}", size: 8, align: :right

      send_data(pdf.render, filename: 'employee.pdf', type: 'application/pdf', disposition: 'inline')
    end


    def download_excel
      users = User.all

      respond_to do |format|
        format.xlsx do
          package = Axlsx::Package.new
          workbook = package.workbook

          workbook.add_worksheet(name: 'Users') do |sheet|

                  # Merge cells for Employee Details and Educational Attainment titles
                  sheet.merge_cells('A1:L1')
                  sheet.merge_cells('M1:Q1')
                  sheet.merge_cells('R1:Y1')
                  sheet.merge_cells('Z1:AE1')
                  sheet.merge_cells('AF1:AI1')
                  sheet.merge_cells('AJ1:AU1')
                  sheet.merge_cells('AV1:AW1')
                  sheet.merge_cells('AX1:AY1')
                  sheet.merge_cells('AZ1:BA1')
                  sheet.merge_cells('BB1:BC1')

                  # Add Employee Details and Educational Attainment headers
                  sheet.add_row(['Employee Details', nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, 'Educational Attainment', nil, nil, nil, nil, 'Position Details', nil, nil, nil, nil, nil, nil, nil, 'Job description', nil, nil, nil, nil, nil, 'Task Performance', nil, nil, nil, 'Other Position',nil, nil, nil,nil, nil, nil,nil, nil, nil,nil, nil, 'Required Training', nil, 'Previous Training Related to the Job Role', nil, 'Previous Training Not Related to the Job Role', nil,  'Requested Training (not related to the job role)' ], style: sheet.styles.add_style(b: true, alignment: { horizontal: :center }, sz: 18))

            # Add headers
            sheet.add_row(['Employee No.', 'Email', 'First Name','Middle Name','Last Name', 'Division', 'Department', 'Position Title', 'Year in Service', 'Contact No.', 'Immidiate Superior','Immidiate Superior Title','Course','Year Graduated','Undergraduate','Skills','Other Skills','Work Hours Perday','Work Hours Perweek','Workdays','Break Time','Lunch Time','Overtime Weekday','Overtime Weekend','Benefits','Job Description','Job Performed','Whenever this work done','Time alloted for this job','Is this within your current job description','Reasons for doing this task','Required Competencies','Task that are not done','Reasons for not doing the task','Impact of not doing the task','
              Position Title','Position Year','Position Month','Job Performed','How often do you perform this task?','Time allotted for this job','Is this within your current job description?','Reason for doing this task','Task that are not done','Reasons for not doing the task','Impact of not doing the task','Competencies','Type of Training(Required Training)','Benefits of training in your current role(Required Training)','Type of Training(Previous Training Related)','Benefits of training in your current role(Previous Training Related)','Type of Training(Previous Training Not Related)','Benefits of training in your current role(Previous Training Not Related)','Type of Training(Requested Training)','Benefits of training in your current role(Requested Training)'], style: sheet.styles.add_style(b: true, alignment: { horizontal: :center }))

            # Add data
            users.each do |user|


              benefits_string = user.emp_detail&.benefits&.map(&:benefit)&.join(',')

            #for Job Description
              description_string = user.jb_description&.description

              nested_description_string = user.jb_description&.nested_descriptions&.map(&:description)&.join(',')

              description_list = [description_string, nested_description_string].compact
              .map { |desc| desc&.split(/\W+/) }
              .flatten
              .map { |desc| desc&.strip&.gsub(/\n/, "\r\n") }
              .reject(&:empty?)

              job_performed_list = user.jb_description&.jb_performeds&.map(&:job_performed)
              job_done_list = user.jb_description&.jb_performeds&.map(&:job_done)
              # Create a list of strings for job_hr and job_min for each jb_performed record
              job_hr_min_list = user.jb_description&.jb_performeds&.map do |jb_performed|
                "#{jb_performed.job_hr} hours and #{jb_performed.job_min} minutes"
              end
              job_current_list = user.jb_description&.jb_performeds&.map do |jb_performed|
                jb_performed.job_current ? 'Yes' : 'No'
              end
              job_reason_list = user.jb_description&.jb_performeds&.map(&:job_reason)

              #for taskperformance
              task_comptency_list = user.taskperformance&.competencies&.map(&:competencies)
              task_notdone_list = [
                user.taskperformance&.task_notdone,
                user.taskperformance&.nested_taskperfomances&.map(&:task_notdone)&.join(',')
              ].compact

              task_reason_list = [
                user.taskperformance&.task_reason,
                user.taskperformance&.nested_taskperfomances&.map(&:task_reason)&.join(',')
              ].compact

              task_impact_list = [
                user.taskperformance&.task_impact,
                user.taskperformance&.nested_taskperfomances&.map(&:task_impact)&.join(',')
              ].compact

             # For other position
            other_position_list = user.other_positions.present? ? user.other_positions&.map(&:pos_title).join("\r\n") : nil
            other_year_list = user.other_positions.present? ? user.other_positions&.map(&:pos_yr).join("\r\n") : nil
            other_month_list = user.other_positions.present? ? user.other_positions&.map(&:pos_month).join("\r\n") : nil
            other_job_performed_list = user.other_positions.present? ? user.other_positions.flat_map { |op| op.other_perfromeds&.map(&:job_performed) }.compact.join("\r\n") : nil
            other_job_done_list = user.other_positions.present? ? user.other_positions.flat_map { |op| op.other_perfromeds&.map(&:job_done) }.compact.join("\r\n") : nil
            other_hr_min_list = user.other_positions.present? ? user.other_positions.flat_map { |op| op.other_perfromeds&.map { |opd| "#{opd.job_hr} hours and #{opd.job_min} minutes" } }.compact.join("\r\n") : nil
            other_current_list = user.other_positions.present? ? user.other_positions.flat_map { |op| op.other_perfromeds&.map { |opd| opd.job_current ? 'Yes' : 'No' } }.compact.join("\r\n") : nil
            other_job_reason_list = user.other_positions.present? ? user.other_positions.flat_map { |op| op.other_perfromeds&.map(&:job_reason) }.compact.join("\r\n") : nil

            other_task_notdone_list = user.other_positions.present? ? user.other_positions.flat_map { |op| op.other_taskperformances&.map(&:task_notdone) }.compact.join("\r\n") : nil
            other_task_reason_list = user.other_positions.present? ? user.other_positions.flat_map { |op| op.other_taskperformances&.map(&:task_reason) }.compact.join("\r\n") : nil
            other_task_impact_list = user.other_positions.present? ? user.other_positions.flat_map { |op| op.other_taskperformances&.map(&:task_impact) }.compact.join("\r\n") : nil

            other_competencies_list = user.other_positions.present? ? user.other_positions.flat_map { |op| op.other_competences&.map(&:competencies) }.compact.join("\r\n") : nil

            #for Required Training

            #required training
            train_type_list = [
              user.req_training&.train_type,
              user.req_training&.nested_trainings&.map(&:train_type)&.join(',')
            ].compact

            train_benefit_list = [
              user.req_training&.train_benefit,
              user.req_training&.nested_trainings&.map(&:train_benefit)&.join(',')
            ].compact


            # Related training
            train_type_related_list = user.req_training.present? ? user.req_training.rel_trainings&.map(&:train_type)&.reject(&:empty?)&.join("\r\n") : nil
            train_benefit_related_list = user.req_training.present? ? user.req_training.rel_trainings&.map(&:train_benefit)&.reject(&:empty?)&.join("\r\n") : nil

            # Not related training
            train_type_notrelated_list = user.req_training.present? ? user.req_training.notrel_trainings&.map(&:train_type)&.reject(&:empty?)&.join("\r\n") : nil
            train_benefit_notrelated_list = user.req_training.present? ? user.req_training.notrel_trainings&.map(&:train_benefit)&.reject(&:empty?)&.join("\r\n") : nil

            # Request training
            train_type_request_list = user.req_training.present? ? user.req_training.request_trainings&.map(&:train_type)&.reject(&:empty?)&.join("\r\n") : nil
            train_benefit_request_list = user.req_training.present? ? user.req_training.request_trainings&.map(&:train_benefit)&.reject(&:empty?)&.join("\r\n") : nil



              sheet.add_row([
                #empplyee Details
                user.emp_detail&.emp_id,
                user.email,
                user.emp_detail&.firstname,
                user.emp_detail&.middlename,
                user.emp_detail&.lastname,
                user.emp_detail&.division,
                user.emp_detail&.department,
                user.emp_detail&.pos_title,
                "#{user.emp_detail&.ser_year} year#{'s' if user.emp_detail&.ser_year != 1}" +
                (user.emp_detail&.ser_year.present? && user.emp_detail&.ser_month.present? ? " and " : "") +
                "#{user.emp_detail&.ser_month} month#{'s' if user.emp_detail&.ser_month != 1}",
                user.emp_detail&.contact,
                user.emp_detail&.sup_name,
                user.emp_detail&.sup_title,
                user.emp_detail&.educ_course,
                user.emp_detail&.educ_grad,
                user.emp_detail&.educ_undergrad,
                user.emp_detail&.educ_skill,
                user.emp_detail&.educ_othskill,
                user.emp_detail&.hr_perday,
                user.emp_detail&.hr_perweek,
                user.emp_detail&.workday,
                user.emp_detail&.launch,
                user.emp_detail&.break,
                user.emp_detail&.ot_weekday ? 'Yes' : 'No',
                user.emp_detail&.ot_weekend ? 'Yes' : 'No',
                benefits_string,
                description_list&.join("\r\n"),
                job_performed_list&.join("\r\n"),
                job_done_list&.join("\r\n"),
                job_hr_min_list&.join("\r\n"),
                job_current_list&.join("\r\n"),
                job_reason_list&.join("\r\n"),
                task_comptency_list&.join("\r\n"),
                task_notdone_list&.join("\r\n"),
                task_reason_list&.join("\r\n"),
                task_impact_list&.join("\r\n"),
                other_position_list,
                other_year_list,
                other_month_list,
                other_job_performed_list,
                other_job_done_list,
                other_hr_min_list,
                other_current_list,
                other_job_reason_list,
                other_task_notdone_list,
                other_task_reason_list,
                other_task_impact_list,
                other_competencies_list,
                train_type_list&.join("\r\n"),
                train_benefit_list&.join("\r\n"),
                train_type_related_list,
                train_benefit_related_list,
                train_type_notrelated_list,
                train_benefit_notrelated_list,
                train_type_request_list,
                train_benefit_request_list



                ], style: sheet.styles.add_style(
      b: false,
      alignment: { horizontal: :center, vertical: :top, wrap_text: true } # Added wrap_text: true
    ))
            end
          end

          send_data package.to_stream.read, filename: "employee-list-#{Time.now.strftime('%Y%m%d')}.xlsx", type: 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', disposition: 'attachment'
        end
      end
    end





  end
