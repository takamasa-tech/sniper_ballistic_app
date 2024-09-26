class CreateBallistics < ActiveRecord::Migration[7.2]
  def change
    create_table :ballistics do |t|
      t.float :distance
      t.float :angle
      t.float :wind_speed
      t.float :wind_direction
      t.float :calculated_drop
      t.float :calculated_dispersion

      t.timestamps
    end
  end
end
