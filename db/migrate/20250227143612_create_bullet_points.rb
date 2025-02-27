class CreateBulletPoints < ActiveRecord::Migration[8.0]
  def change
    create_table :bullet_points do |t|
      t.references :note, null: false, foreign_key: true
      t.string :classification, null: false
      t.string :statement, null: false

      t.timestamps
    end
  end
end
