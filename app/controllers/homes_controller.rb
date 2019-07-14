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
    redirect_to results_url
  end
end
