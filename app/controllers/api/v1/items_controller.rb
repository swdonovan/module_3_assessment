class Api::V1::ItemsController < API::ApiController
  def index
    render json: all_items
  end

  private
    def all_items
      Item.all
    end
end
