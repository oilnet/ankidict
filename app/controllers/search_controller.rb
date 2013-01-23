class SearchController < ApplicationController
  def index
    @notes = Note.where("flds LIKE :q OR STRIP_ARABIC_DIACRITICS(flds) LIKE :q", :q => "%#{params[:q]}%") if params[:q]
  end
end
