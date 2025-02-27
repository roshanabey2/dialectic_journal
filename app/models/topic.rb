class Topic < ApplicationRecord
  belongs_to :user, optional: true  # topics may be global are user specific
  belongs_to :parent_topic, class_name: 'Topic', optional: true #topics may be at the top of their conceptual heirachy
  has_many :subtopics, class_name: 'Topic', foreign_key: 'parent_topic_id', dependent: :destroy #topic may or may not have subtopics

end
