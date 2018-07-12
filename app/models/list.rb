class List < ApplicationRecord
  validates :title, presence: { message: "Title is Required!" }, length: { maximum: 20 }
  has_many :notes, dependent: :destroy
end
