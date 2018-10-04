class Home < ApplicationRecord
  def self.archived_notes
    Note.where("archived", 1)
  end

  def self.completed_notes
    Note.where("completed", 1)
  end
end
