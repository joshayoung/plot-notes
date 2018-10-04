class List < ApplicationRecord
  has_many :notes, dependent: :destroy

  validates :title, presence: { message: "Title is Required!" },
                    length: { maximum: 20 }
end
