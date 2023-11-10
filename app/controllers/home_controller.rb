class HomeController < ApplicationController
  # before_action :authenticate_user!
  before_action :set_user, only: [:generate_pdf]


    def index
      @user = current_user
      @jb_description = current_user.jb_description || OpenStruct.new(description: 'N/A', jb_performeds: [])
      @taskperformance = current_user.taskperformance || OpenStruct.new(competencies: [], nested_taskperfomances: [])
      @emp_detail = current_user.emp_detail || OpenStruct.new( pos_title: 'N/A', emp_id: 'N/A', ser_year: 'N/A', ser_month: 'N/A')
      @oth_performed = current_user.oth_performed || OpenStruct.new(other_competencies:[] )
      @other_positions = @user.other_positions
      @req_training = current_user.req_training || OpenStruct.new(
        train_type: 'N/A',
        train_benefit: 'N/A',
        sup_name: 'N/A',
        sup_title: 'N/A',
        nested_trainings: [],
        rel_trainings: [OpenStruct.new(train_type: 'N/A', train_benefit: 'N/A')],
        notrel_trainings: [OpenStruct.new(train_type: 'N/A', train_benefit: 'N/A')],
        request_trainings: [OpenStruct.new(train_type: 'N/A', train_benefit: 'N/A')]

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
    @nested_description = current_user.jb_description.nested_descriptions
    @jb_performeds = current_user.jb_description.jb_performeds

    #task performance
    @taskperformance = current_user.taskperformance
    @oth_performed = current_user.oth_performed

    #other position handle
    @other_positions = current_user.other_positions

    #required training
    @req_training = current_user.req_training
    @nested_trainings = current_user.req_training.nested_trainings
    @rel_trainings = current_user.req_training.rel_trainings
    @notrel_trainings = current_user.req_training.notrel_trainings
    @request_trainings = current_user.req_training.request_trainings

    @competencies = current_user.taskperformance.competencies

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
             ["Supervisor Name:", @emp_detail.sup_name&.upcase, "Supervisor Title:", @emp_detail.sup_title&.upcase]],
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
  pdf.text "Position Details", size: 16, style: :bold, align: :left
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
pdf.move_down(30)

      # Title
pdf.bounding_box([0, pdf.cursor], width: pdf.bounds.width) do
  pdf.text "Job Performed", size: 16, style: :bold, align: :left
  pdf.move_down 20
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
end, header: true, cell_style: { border_width: 0, padding: [5, 5] })

 # Add a line break
 pdf.move_down(30)

pdf.bounding_box([0, pdf.cursor], width: pdf.bounds.width) do
  pdf.text "Task Performance", size: 16, style: :bold, align: :left
  pdf.move_down 20
end

pdf.table([
  ["ask that are not done", "Reasons for not doing the task", "Impact of not doing the task"]
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
 pdf.move_down(30)


 pdf.bounding_box([0, pdf.cursor], width: pdf.bounds.width) do
  pdf.text "Required Competencies", size: 16, style: :bold, align: :left
  pdf.move_down 20
end

pdf.table([[competencies_list]],
  cell_style: { border_width: 0, padding: [5, 10] })

# Add a line break
pdf.move_down(50)


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

  if @other_positions.present? && @other_positions.any?
    @other_positions.each do |other_position|
      pdf.bounding_box([0, pdf.cursor], width: pdf.bounds.width) do
        pdf.text "Other Position - #{other_position.pos_title}", size: 16, style: :bold, align: :left
        pdf.move_down 10

        # Table for other_positions and other_performed
        pdf.table([
          ["Position Title", "Position Year", "Position Month", "Job Performed", "Job Done", "Job Hours", "Job Minutes", "Job Current", "Job Reason"]
        ] + [
          [
            other_position.pos_title, other_position.pos_yr, other_position.pos_month, # These will be repeated for each row
            nil, nil, nil, nil, nil, nil # Empty placeholders for single row
          ]
        ] + other_position.other_perfromeds.map { |performed|
          [
            nil, nil, nil, # Empty placeholders for single row
            performed&.job_performed, performed&.job_done, performed&.job_hr, performed&.job_min,
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

      # Add spacing between job positions
      pdf.move_down(20)
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





end
