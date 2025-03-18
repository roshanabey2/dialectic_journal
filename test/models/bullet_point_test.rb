# == Schema Information
# Schema version: 20250227144406
#
# Table name: bullet_points
#
#  id             :bigint           not null, primary key
#  classification :string           not null
#  statement      :string           not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  note_id        :bigint           not null
#
# Indexes
#
#  index_bullet_points_on_note_id  (note_id)
#
# Foreign Keys
#
#  fk_rails_...  (note_id => notes.id)
#
require "test_helper"

class BulletPointTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
