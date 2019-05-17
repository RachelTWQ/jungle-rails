class ReceiptMailer < ApplicationMailer
    default from: "no-reply@jungle.com"

    def receipt_email(order)
        @order = order
        mail(to: @order.email, subject: "Thank you for shopping at Jungle. This is your order ID: #{order.id}")
    end
end
