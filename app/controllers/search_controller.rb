class SearchController < ActionController::Base
  def index
    @results = HarryPotterService.new.search(params[:query]).map { |member| Member.new(member) } if params[:query].present?
  end
end
