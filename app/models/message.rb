# == Schema Information
#
# Table name: messages
#
#  id                    :bigint           not null, primary key
#  cache_creation_tokens :integer
#  cached_tokens         :integer
#  content               :string
#  content_raw           :json
#  input_tokens          :integer
#  output_tokens         :integer
#  role                  :string
#  thinking_signature    :text
#  thinking_text         :text
#  thinking_tokens       :integer
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  chat_id               :bigint           not null
#  conversation_id       :bigint           not null
#  model_id              :bigint
#  note_id               :bigint
#  tool_call_id          :bigint
#
# Indexes
#
#  index_messages_on_chat_id          (chat_id)
#  index_messages_on_conversation_id  (conversation_id)
#  index_messages_on_model_id         (model_id)
#  index_messages_on_note_id          (note_id)
#  index_messages_on_role             (role)
#  index_messages_on_tool_call_id     (tool_call_id)
#
# Foreign Keys
#
#  fk_rails_...  (chat_id => chats.id)
#  fk_rails_...  (conversation_id => conversations.id)
#  fk_rails_...  (model_id => models.id)
#  fk_rails_...  (note_id => notes.id)
#  fk_rails_...  (tool_call_id => tool_calls.id)
#
class Message < ApplicationRecord
  acts_as_message
  has_many_attached :attachments

  broadcasts_to ->(message) { "chat_#{message.chat_id}" }, inserts_by: :append

  def broadcast_append_chunk(content)
    broadcast_append_to "chat_#{chat_id}",
      target: "message_#{id}_content",
      content: ERB::Util.html_escape(content.to_s)
  end
end
