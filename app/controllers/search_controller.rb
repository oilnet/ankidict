class SearchController < ApplicationController
  def index
    @notes = Note.where("flds LIKE :q OR STRIP_ARABIC_DIACRITICS(flds) LIKE :q", :q => "%#{params[:q]}%") unless params[:q].blank?
  end
end
