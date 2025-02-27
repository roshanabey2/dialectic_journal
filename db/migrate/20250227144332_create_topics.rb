class CreateTopics < ActiveRecord::Migration[8.0]
  def change
    create_table :topics do |t|
      t.string :name
      t.integer :parent_topic_id
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_foreign_key :topics, :topics, column: :parent_topic_id
    add_index :topics, :parent_topic_id
  end
end
