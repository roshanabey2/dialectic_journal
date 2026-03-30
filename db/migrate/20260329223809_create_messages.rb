class CreateMessages < ActiveRecord::Migration[8.0]
  def change
    add_column :messages, :content_raw, :json unless column_exists?(:messages, :content_raw)
    add_column :messages, :thinking_text, :text unless column_exists?(:messages, :thinking_text)
    add_column :messages, :thinking_signature, :text unless column_exists?(:messages, :thinking_signature)
    add_column :messages, :thinking_tokens, :integer unless column_exists?(:messages, :thinking_tokens)
    add_column :messages, :input_tokens, :integer unless column_exists?(:messages, :input_tokens)
    add_column :messages, :output_tokens, :integer unless column_exists?(:messages, :output_tokens)
    add_column :messages, :cached_tokens, :integer unless column_exists?(:messages, :cached_tokens)
    add_column :messages, :cache_creation_tokens, :integer unless column_exists?(:messages, :cache_creation_tokens)

    add_index :messages, :role unless index_exists?(:messages, :role)
  end
end
