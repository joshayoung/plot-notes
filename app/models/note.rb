class Note < ApplicationRecord
  belongs_to :list
  has_many :tags, dependent: :destroy

  validates :title, presence: { message: "Title is Required!" },
                    length: { maximum: 20 }
  validates :details, length: { maximum: 150 }

  scope :archived, -> { where(archived: 1) }
  scope :completed, -> { where(completed: 1) }
  scope :active, -> { where("archived != 1 AND completed != 1") }
end
