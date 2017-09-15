class SearchController < ApplicationController
  def index
    zip = params[:zip_code].to_i
    @stores = best_buy_store(zip)
  end

  private
    def best_buy_store(zipcode)
      BestBuyStore.stores(zipcode)
    end
end
