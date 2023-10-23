class HomeController < ApplicationController
 
    def index
      @user = current_user
      @jb_description = current_user.jb_description || OpenStruct.new(description: 'N/A', jb_performeds: [])
      @taskperformance = current_user.taskperformance || OpenStruct.new(competencies: [], nested_taskperfomances: [])
      @emp_detail = current_user.emp_detail || OpenStruct.new(fullname: 'N/A', pos_title: 'N/A', emp_id: 'N/A', ser_year: 'N/A', ser_month: 'N/A')
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




end
