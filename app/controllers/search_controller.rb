class SearchController < ApplicationController
  def index
    if params[:q]
      string = params[:q].strip
      string = ActiveRecord::Arabic.clean(string)
    end
    @notes = Note.where(
      "flds LIKE :q OR STRIP_ARABIC_DIACRITICS(flds) LIKE :q OR tags LIKE :q", 
      :q => "%#{string}%").order('flds ASC') unless params[:q].blank?
  end

  def details
    @note = Note.find(params[:id])
    render(:layout => false) if request.xhr?
  end
end
