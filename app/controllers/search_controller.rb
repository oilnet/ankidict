class SearchController < ApplicationController
  def index
    @notes = Note.where("flds LIKE :q OR STRIP_ARABIC_DIACRITICS(flds) LIKE :q", :q => "%#{params[:q].strip}%") unless params[:q].blank?
  end

  def details
    @note = Note.find(params[:id])
    render(:layout => false) if request.xhr?
  end
end
