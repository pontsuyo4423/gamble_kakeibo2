class LimitsController < ApplicationController
  before_action :authenticate_user!

  def new
    if current_user.limit.present?
      redirect_to edit_limit_path(current_user.limit)
    else
      @limit = current_user.build_limit
    end
  end

  def create
    if current_user.limit.present?
      update
    else
      @limit = current_user.build_limit(limit_params)
      if @limit.save
        redirect_to root_path, notice: '上限金額を設定しました。'
      else
        render :new
      end
    end
  end

  def edit
    @limit = current_user.limit
  end

  def update
    @limit = current_user.limit || current_user.build_limit
    if @limit.update(limit_params)
      redirect_to root_path, notice: '上限金額を更新しました。'
    else
      render action: @limit.new_record? ? :new : :edit
    end
  end

  private

  def limit_params
    params.require(:limit).permit(:goal)
  end
end

