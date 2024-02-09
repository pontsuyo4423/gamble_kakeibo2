class IncomesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @incomes = Income.all
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
      redirect_to root_path, notice: '収入を登録しました。'
    else
      render :new
    end
  end
  
  
  

  def update
  end

  def destroy
  end
 

  private

  def income_params
    params.require(:income).permit(:category_id, :date, :price)
  end
  
  
end
