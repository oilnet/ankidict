class SearchController < ApplicationController
  def index
    @notes = Note.where(
      "flds LIKE :q OR STRIP_ARABIC_DIACRITICS(flds) LIKE :q OR tags LIKE :q", 
      :q => "%#{params[:q].strip}%").order('flds DESC') unless params[:q].blank?
  end

  def details
    @note = Note.find(params[:id])
    render(:layout => false) if request.xhr?
  end
end
