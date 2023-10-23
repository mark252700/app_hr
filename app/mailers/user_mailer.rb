class UserMailer < ApplicationMailer
    def approval_notification(user)
        @user = user
        mail(to: @user.email, subject: 'Account Approval Notification')
      end
end
