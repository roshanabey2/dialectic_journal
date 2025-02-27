class CreateMessages < ActiveRecord::Migration[8.0]
  def change
    create_table :messages do |t|
      t.references :conversation, null: false, foreign_key: true
      t.references :note, foreign_key: true
      t.string :role
      t.string :content

      t.timestamps
    end
  end
end
