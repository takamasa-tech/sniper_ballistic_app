class BallisticsController < ApplicationController
  before_action :authenticate_user! # ログインが必要

  def new
    @ballistic = Ballistic.new
  end

  def create
    @ballistic = Ballistic.new(ballistic_params)
    if @ballistic.save
      redirect_to @ballistic # 保存後に結果画面へリダイレクト
    else
      render :new
    end
  end

  def show
    @ballistic = Ballistic.find(params[:id])
  end

  private

  def ballistic_params
    params.require(:ballistic).permit(:distance, :angle, :wind_speed, :wind_direction, :calculated_drop, :calculated_dispersion)
  end
end
