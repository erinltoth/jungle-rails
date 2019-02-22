class UserMailer < ApplicationMailer
  default from: 'no-reply@jungle.co'

  def order_receipt(order)
    @order = order
    mail(to: @order.email, subject: 'Order Receipt')
  end
end