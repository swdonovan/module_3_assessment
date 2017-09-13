class SearchController < ApplicationController
  def index
    @stores = BestBuyStore.new(params[:zip_code])
  end
end
