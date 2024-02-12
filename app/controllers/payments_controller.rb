class PaymentsController < ApplicationController
  def index
  end

  def new
    @payment = Payment.new
  end

  def create
    @payment = Payment.new(payment_params)
    @payment.user = current_user
    if @payment.save
      redirect_to root_path, notice: '支出を登録しました。'
    else
      render :new
    end
  end

  def destroy
    payment = Payment.find(params[:id])
    payment.destroy
    redirect_to incomes_path(selected_month: session[:selected_month])
  end


  private

  def payment_params
    params.require(:payment).permit(:category_id, :date, :price)
  end
end
