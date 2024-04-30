class Like < ApplicationRecord
  belongs_to :user
  belongs_to :twit

  validates :user_id, uniqueness: {scope: :twit_id}
end
