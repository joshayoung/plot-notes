class List < ApplicationRecord
  validates :title, presence: { message: "Title is Required!" }, length: { maximum: 20 }
  has_many :notes, dependent: :destroy

  def archived
    notes.where("archived = '1'")
  end

  def completed
    notes.where("completed = '1'")
  end
end
