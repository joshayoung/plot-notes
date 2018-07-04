class List < ApplicationRecord
  validates :title, presence: { message: "Title is Required!" }
end
