class Api::V1::ItemsController < API::ApiController
  def index
    render json: all_items
  end

  def show
    render json: single_item(params[:id])
  end

  private
    def all_items
      @items = Item.all
    end

    def single_item(id)
      @item = Item.find(id).to_a
    end
end
