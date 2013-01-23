class SearchController < ApplicationController
  def index
    @notes = Note.where('flds LIKE ?', "%#{params[:q]}%") if params[:q]
  end
end
