class ApplicationMailer < ActionMailer::Base
  default from: "no-reply@jungle.com"

  def order_receipt(order)
      @order = order
      mail(to: @order.email, subject: "Order Receipt")
  end

  layout 'mailer'
end
