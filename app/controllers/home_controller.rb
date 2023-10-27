class HomeController < ApplicationController
  # before_action :authenticate_user!
  before_action :set_user, only: [:generate_pdf]


    def index
      @user = current_user
      @jb_description = current_user.jb_description || OpenStruct.new(description: 'N/A', jb_performeds: [])
      @taskperformance = current_user.taskperformance || OpenStruct.new(competencies: [], nested_taskperfomances: [])
      @emp_detail = current_user.emp_detail || OpenStruct.new( pos_title: 'N/A', emp_id: 'N/A', ser_year: 'N/A', ser_month: 'N/A')
      @oth_performed = current_user.oth_performed || OpenStruct.new(other_competencies: [],nested_othperformes: []  ,oth_position: OpenStruct.new(pos_title: 'N/A', pos_yr: 0, pos_month: 0))
      @req_training = current_user.req_training || OpenStruct.new(
        train_type: 'N/A',
        train_benefit: 'N/A',
        sup_name: 'N/A',
        sup_title: 'N/A',
        nested_trainings: [],
        rel_trainings: [OpenStruct.new(train_type: 'N/A', train_benefit: 'N/A')],
        notrel_trainings: [OpenStruct.new(train_type: 'N/A', train_benefit: 'N/A')]
      )
  end



  def set_user
    @user = current_user
  end



  def generate_pdf
    @user = current_user

    #employee details
    @emp_detail = current_user.emp_detail
    @benefits = current_user.emp_detail.benefits

    #job Description
    @jb_description = current_user.jb_description
    @jb_performeds = current_user.jb_description.jb_performeds

    #task performance
    @taskperformance = current_user.taskperformance
    @oth_performed = current_user.oth_performed

    #other position handle
    @oth_position = current_user.oth_performed.oth_position
    @nested_othperformes = current_user.oth_performed.nested_othperformes
    @other_tasks = current_user.oth_performed.other_tasks
    @other_competencies = current_user.oth_performed.other_competencies

    #required training
    @req_training = current_user.req_training
    @nested_trainings = current_user.req_training.nested_trainings
    @rel_trainings = current_user.req_training.rel_trainings
    @notrel_trainings = current_user.req_training.notrel_trainings

    @competencies = current_user.taskperformance.competencies

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
