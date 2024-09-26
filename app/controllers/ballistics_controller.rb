class BallisticsController < ApplicationController
  def new
    @ballistic = Ballistic.new
  end

  def create
    @ballistic = Ballistic.new(ballistic_params)
    if @ballistic.save
      redirect_to @ballistic, notice: '弾道計算が完了しました'
    else
      render :new
    end
  end

  def show
    @ballistic = Ballistic.find(params[:id])
    @trajectory = @ballistic.calculate_trajectory
  end

  private

  def ballistic_params
    params.require(:ballistic).permit(:distance, :angle, :wind_speed, :wind_direction)
  end
end
