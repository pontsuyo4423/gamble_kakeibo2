class IncomesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_income, only: [:edit, :update]

  def index
    @limit = current_user.limit

    available_income_months = current_user.incomes.group_by_month(:date, format: "%Y年%m月").count.keys
    available_payment_months = current_user.payments.group_by_month(:date, format: "%Y年%m月").count.keys
    @available_months = (available_income_months + available_payment_months).uniq.sort.reverse
  
    # 月毎の収入と支出の概要を確実にハッシュとして初期化
    @monthly_incomes_summary = current_user.incomes.group_by_month(:date, format: "%Y年%m月").sum(:price) || {}
    @monthly_payments_summary = current_user.payments.group_by_month(:date, format: "%Y年%m月").sum(:price) || {}
  
    # 月毎の収支の概要を計算
    @monthly_balances_summary = {}
    @available_months.each do |month|
      incomes = @monthly_incomes_summary[month] || 0
      payments = @monthly_payments_summary[month] || 0
      @monthly_balances_summary[month] = incomes - payments
    end
      
    # 日毎の収支変数を空のActiveRecord_Relationで初期化
    @incomes_by_date = Income.none
    @payments_by_date = Payment.none
  
    @daily_incomes = {}
    @daily_payments = {}
    @daily_balances = {}
  
    if params[:selected_month].present?
      selected_month = Date.strptime(params[:selected_month], "%Y年%m月")
      start_date = selected_month.beginning_of_month
      end_date = selected_month.end_of_month
      session[:selected_month] = params[:selected_month]
    elsif session[:selected_month].present?
      selected_month = Date.strptime(session[:selected_month], "%Y年%m月")
      start_date = selected_month.beginning_of_month
      end_date = selected_month.end_of_month
      params[:selected_month] = session[:selected_month]
    end
  
    if selected_month.present?
      @incomes_by_date = current_user.incomes.where(date: start_date..end_date).order(:date)
      @payments_by_date = current_user.payments.where(date: start_date..end_date).order(:date)
  
      # 選択された月の日ごとの収入、支出、および収支を計算
      @daily_incomes = current_user.incomes.where(date: start_date..end_date).group_by_day(:date).sum(:price)
      @daily_payments = current_user.payments.where(date: start_date..end_date).group_by_day(:date).sum(:price)
      @daily_balances = @daily_incomes.merge(@daily_payments) { |key, income, payment| income - payment }
    end
  end
  
  
  def show
  end

  def new
    @income = Income.new
  end

  def edit
  end

  def create
    @income = Income.new(income_params)
    @income.user = current_user
    if @income.save
      redirect_to root_path
    else
      render :new
    end
  end
  
  
  

  def update
   if @income.update(income_params) 
     redirect_to incomes_path
   else
    render :edit
   end
  end

  def destroy
    income = Income.find(params[:id])
    income.destroy
    redirect_to incomes_path(selected_month: session[:selected_month])
  end
  
 
  def lifetime_balance
    @total_incomes = current_user.incomes.sum(:price)
    @total_payments = current_user.payments.sum(:price)
    @lifetime_balance = @total_incomes - @total_payments
  end

  private

  def income_params
    params.require(:income).permit(:category_id, :date, :price)
  end
  
  def set_income
    @income = current_user.incomes.find(params[:id])
  end
  
end
