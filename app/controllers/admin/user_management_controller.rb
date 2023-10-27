# app/controllers/admin/user_management_controller.rb

class Admin::UserManagementController < ApplicationController
    before_action :authenticate_admin! # Make sure only admins can access this controller

    # Display a list of users
    def index
      @users = User.all
    end

    # Display the form for creating a new user
    def new
      @user = User.new
    end

    # Create a new user
    def create
      @user = User.new(user_params)

      if @user.save
        redirect_to admin_index_path, notice: 'User created successfully.'
      else
        render :new
      end
    end

    # Display the form for editing a user
    def edit
      @user = User.find(params[:id])
    end

    # Update a user's information
    def update
      @user = User.find(params[:id])

      if @user.update(user_params)
        redirect_to admin_index_path, notice: 'User updated successfully.'
      else
        render :edit
      end
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

    def show_user
      @user = User.find(params[:id]) # Fetch the user based on the passed ID
      @jb_description = @user.jb_description || OpenStruct.new(description: 'N/A', jb_performeds: [])
      @taskperformance = @user.taskperformance || OpenStruct.new(competencies: [], nested_taskperfomances: [])
      @emp_detail = @user.emp_detail || OpenStruct.new(fullname: 'N/A', pos_title: 'N/A', emp_id: 'N/A', ser_year: 'N/A', ser_month: 'N/A')
      @oth_performed = @user.oth_performed || OpenStruct.new(other_competencies: [], nested_othperformes: [], oth_position: OpenStruct.new(pos_title: 'N/A', pos_yr: 0, pos_month: 0))
      @req_training = @user.req_training || OpenStruct.new(
        train_type: 'N/A',
        train_benefit: 'N/A',
        sup_name: 'N/A',
        sup_title: 'N/A',
        nested_trainings: [],
        rel_trainings: [OpenStruct.new(train_type: 'N/A', train_benefit: 'N/A')],
        notrel_trainings: [OpenStruct.new(train_type: 'N/A', train_benefit: 'N/A')]
      )
    end

    def destroy
      @user = User.find(params[:id])
      @user.destroy

      respond_to do |format|
        format.html { redirect_to admin_index_path, notice: "User was successfully destroyed." }
        format.json { head :no_content }
      end
    end

    private

    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation, :role)
    end


    def authenticate_admin!
        if current_user.nil?
          redirect_to new_user_session_path, alert: 'Please sign in to access this page'
        elsif !current_user.admin?
          redirect_to root_path, alert: 'Access denied'
        end
      end
  end
