# == Schema Information
# Schema version: 20250227144406
#
# Table name: messages
#
#  id              :bigint           not null, primary key
#  content         :string
#  role            :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  conversation_id :bigint           not null
#  note_id         :bigint
#
# Indexes
#
#  index_messages_on_conversation_id  (conversation_id)
#  index_messages_on_note_id          (note_id)
#
# Foreign Keys
#
#  fk_rails_...  (conversation_id => conversations.id)
#  fk_rails_...  (note_id => notes.id)
#
class Message < ApplicationRecord
  belongs_to :conversation
  belongs_to :note, optional:true
end
