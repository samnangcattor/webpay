class PurchasesController  < ApplicationController
  SECRET_KEY = "test_secret_4eQ6elgWMdRXb377GJbvAgJi"

  def index
  end

  def create
    amount = params[:amount]
    token = params[:"webpay-token"]
    webpay = WebPay.new SECRET_KEY
    charge = webpay.charge.create amount: amount, currency: "jpy", card: token
    if charge.paid
      flash[:success] = t "flashs.messages.paid"
    else
      flash[:alert] = t "flashs.messages.unpaid"
    end
    redirect_to purchases_path
  end
end
