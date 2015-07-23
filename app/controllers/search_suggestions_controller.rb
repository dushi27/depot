class SearchSuggestionsController < ApplicationController
  skip_before_filter :authorize 
  
  def index
    render json: SearchSuggestion.terms_for(params[:term])
  end
end
