class Message < ApplicationRecord
  belongs_to :conversation
  belongs_to :note, optional:true
end
