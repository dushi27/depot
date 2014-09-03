class Notifier < ActionMailer::Base
  default from: "bookzrails@gmail.com"
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifier.order_received.subject
  # 
  def order_received(order)
    @order = order
    mail to: order.email, subject: 'Book-Z Store Order Confirmation'
  end  

  def order_shipped(order)
    @order = order
    mail to: order.email, subject: 'Book-Z Store Order Shipped'
  end
  
end
