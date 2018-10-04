class HomesController < ApplicationController
  def index
    @lists = List.all
  end

  def archived_notes
    @archived_notes = Home.archived_notes
  end

  def completed_notes
    @completed_notes = Home.completed_notes
  end
end
