class FinalStepController < ApplicationController
  def index
    @user = current_user
    @jb_description = current_user.jb_description || OpenStruct.new(description: 'N/A')
    @taskperformance = current_user.taskperformance || OpenStruct.new(competencies: [])
    @emp_detail = current_user.emp_detail || OpenStruct.new(fullname: 'N/A', pos_title: 'N/A', emp_id: 'N/A', ser_year: 'N/A', ser_month: 'N/A')
    @oth_performed = current_user.oth_performed || OpenStruct.new(other_competencies: [], oth_position: [])
    @req_training = current_user.req_training || OpenStruct.new(
      train_type: 'N/A',
      train_benefit: 'N/A',
      sup_name: 'N/A',
      sup_title: 'N/A',
      nested_trainings: [],
      rel_trainings: [OpenStruct.new(train_type: 'N/A', train_benefit: 'N/A')],
      notrel_trainings: [OpenStruct.new(train_type: 'N/A', train_benefit: 'N/A')]
    )

    # Other assignments here...
    if current_user.submitted
      flash[:alert] = 'You have already submitted this form.'
      redirect_to home_index_path  # Replace with the path you want to redirect to
    end

    # Check if all the required data is empty
    if @emp_detail.fullname == 'N/A'
      redirect_to new_emp_detail_path
    end
  end

  def update_submission
    current_user.update(submitted: true)
    redirect_to home_index_path, notice: 'Submission successful.'
  end
end
