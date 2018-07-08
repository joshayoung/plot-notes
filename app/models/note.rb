class Note < ApplicationRecord
  belongs_to :list
  validates :title, presence: { message: "Title is Required!" }


  class << self
    def archived
      where("archived = '1'")
    end

    def completed
      where("completed = '1'")
    end

    def active
      where("completed != '1' AND archived != '1'")
    end
  end

end
