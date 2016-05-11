class Comment < ActiveRecord::Base
  belongs_to :answer
  belongs_to :user

  delegate :question, to: :answer

  validates :body, presence: true

  scope :confirmable, -> { where.not(confirmed_at: nil) }
end
