class SearchController < ApplicationController
  def index
    @notes = Note.find(:all, :conditions => ["flds LIKE ?", "%#{params[:q]}%"]) if params[:q]
  end
end
