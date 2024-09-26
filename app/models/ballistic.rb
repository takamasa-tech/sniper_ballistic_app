class Ballistic < ApplicationRecord
  def calculate_trajectory
    gravity = 9.81  # 重力加速度
    velocity = 820  # M24用7.62mm×51 NATO弾の初速 (m/s)

    time = distance / velocity  # 飛行時間の計算
    drop = 0.5 * gravity * time**2  # 弾道の落下距離
    horizontal_dispersion = wind_speed * time  # 風による水平偏差

    { drop: drop, horizontal_dispersion: horizontal_dispersion }
  end
end
