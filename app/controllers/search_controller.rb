class SearchController < ActionController::Base
  def index
    if params[:house] == "Gryffindor"
      @results = HarryPotterService.new.search_gryffindor.map { |member| Member.new(member) }
    end
  end
end
