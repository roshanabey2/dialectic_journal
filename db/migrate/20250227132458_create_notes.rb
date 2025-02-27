class CreateNotes < ActiveRecord::Migration[8.0]
  def change
    create_table :notes do |t|
      t.references :user, null: false, foreign_key: true
      t.string :entry_type, null: false
      t.string :orignal_text, null: false
      t.jsonb :llm_summary

      t.timestamps
    end
  end
end
