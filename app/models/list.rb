class List < ApplicationRecord
  validates :title, presence: { message: "Title is Required!" }
  has_many :notes, dependent: :destroy
end
