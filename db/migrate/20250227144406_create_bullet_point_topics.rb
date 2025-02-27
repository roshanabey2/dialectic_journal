class CreateBulletPointTopics < ActiveRecord::Migration[8.0]
  def change
    create_table :bullet_point_topics do |t|
      t.references :bullet_point, null: false, foreign_key: true
      t.references :topic, null: false, foreign_key: true

      t.timestamps
    end
  end
end
