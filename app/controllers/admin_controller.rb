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

  
    def destroy
      @user = User.find(params[:id])
      @user.destroy
  
      redirect_to admin_index_path, notice: "User was successfully destroyed."
    end

  end
