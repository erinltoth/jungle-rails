class ApplicationMailer < ActionMailer::Base
  default from: "no-reply@jungle.com"

  def order_receipt(user)
      @user = user
      mail(to: @user.email, subject: "SOME SUBJECT!")
  end

  layout 'mailer'
end
