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

  def search; end

  def results; end

  def search_results
    @tags = Tag.joins(:note).where("tags.title = ?", search_value)
    @notes = Note.joins(:tags).where("tags.title = ?", search_value)
    render :results
  end

private

  def search_value
    params.require(:search).permit(:value)[:value]
  end
end
