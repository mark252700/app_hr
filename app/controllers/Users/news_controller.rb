# class Users::News < Devise::News
# def create
#   @user = User.new(user_params)

#   if @user.save
#     redirect_to  new_user_session_path, notice: 'User created successfully.'
#   else
#     render :new
#   end
# end

# private

# def user_params
#   params.require(:user).permit(:email, :password, :password_confirmation, :role)
# end

# end
