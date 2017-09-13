class Api::V1::ItemsController < API::ApiController
  def index
    render json: all_items
  end

  def show
    render json: single_item(params[:id])
  end

  private
    def all_items
      Item.all
    end

    def single_item(id)
      Item.find_by(id: id)
    end
end
