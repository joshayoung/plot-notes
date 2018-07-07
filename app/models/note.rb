class Note < ApplicationRecord
  belongs_to :list
  validates :title, presence: { message: "Title is Required!" }
end
