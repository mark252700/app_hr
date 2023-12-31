# app/controllers/admin/user_management_controller.rb

class Admin::UserManagementController < ApplicationController
    # before_action :authenticate_admin! # Make sure only admins can access this controller

    # Display a list of users
    def index
      @users = User.all
    end

    # Display the form for creating a new user
    def new
      @user = User.new
    end

    def create
      @user = User.new(user_params)

      if @user.save
        redirect_to new_user_session_path, notice: 'You account has been created successfully, please wait for the admin to approve your account.'
      else

        flash[:validation_errors] = @user.errors.full_messages
        redirect_to new_user_session_path
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

        flash[:success] = "User has been approved."
      else
        flash[:error] = "Failed to approve the user."
        flash[:update_errors] = @user.errors.full_messages.join(', ')
      end

      redirect_to admin_index_path
    end

    def unsubmitted_user
      @user = User.find(params[:id])

      if @user.update(submitted: false)
        flash[:success] = "User has been unsubmitted."
      else
        flash[:error] = "Failed to unsubmit the user."
        flash[:update_errors] = @user.errors.full_messages.join(', ')
      end

      redirect_to admin_index_path
    end



    def archieve_user
      @user = User.find(params[:id])

      if @user.update(archive: true)
        flash[:success] = "User has been archieve."
      else
        flash[:error] = "Failed to archieve the user."
        flash[:update_errors] = @user.errors.full_messages.join(', ')
      end

      redirect_to admin_index_path
    end

    def restore_user
      @user = User.find(params[:id])

      if @user.update(archive: false)
        flash[:success] = "User has been Restore."
      else
        flash[:error] = "Failed to Restore the user."
        flash[:update_errors] = @user.errors.full_messages.join(', ')
      end

      redirect_to admin_index_path
    end

    def show_user
      @user = User.find(params[:id]) # Fetch the user based on the passed ID
      @jb_description = @user.jb_description || OpenStruct.new(description: 'N/A', jb_performeds: [])
      @taskperformance = @user.taskperformance || OpenStruct.new(competencies: [], nested_taskperfomances: [])
      @emp_detail = @user.emp_detail || OpenStruct.new(fullname: 'N/A', pos_title: 'N/A', emp_id: 'N/A', ser_year: 'N/A', ser_month: 'N/A')
      @oth_performed = @user.oth_performed || OpenStruct.new(other_competencies: [])
      @other_positions = @user.other_positions
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
