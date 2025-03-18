# == Schema Information
# Schema version: 20250227144406
#
# Table name: notes
#
#  id           :bigint           not null, primary key
#  entry_type   :string           not null
#  llm_summary  :jsonb
#  orignal_text :string           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  user_id      :bigint           not null
#
# Indexes
#
#  index_notes_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Note < ApplicationRecord
  belongs_to :user
  has_many :bullet_points
  has_many :messages
end
