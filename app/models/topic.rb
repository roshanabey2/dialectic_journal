# == Schema Information
# Schema version: 20250227144406
#
# Table name: topics
#
#  id              :bigint           not null, primary key
#  name            :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  parent_topic_id :integer
#  user_id         :bigint
#
# Indexes
#
#  index_topics_on_parent_topic_id  (parent_topic_id)
#  index_topics_on_user_id          (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (parent_topic_id => topics.id)
#  fk_rails_...  (user_id => users.id)
#
class Topic < ApplicationRecord
  belongs_to :user, optional: true  # topics may be global are user specific
  belongs_to :parent_topic, class_name: 'Topic', optional: true #topics may be at the top of their conceptual heirachy
  has_many :subtopics, class_name: 'Topic', foreign_key: 'parent_topic_id', dependent: :destroy #topic may or may not have subtopics

end
