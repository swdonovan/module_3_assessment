class SearchController < ApplicationController
  def index
    binding.pry
    @stores = BestBuyStore.new(params[:zip_code])
  end
end
