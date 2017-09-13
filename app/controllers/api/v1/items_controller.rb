class Api::V1::ItemsController < API::ApiController
  def index
    items = all_items
    render json: items
  end

  def show
    item = single_item(params[:id])
    render json: item
  end

  def create
    item = Item.new(safe_params)
    if item.save
      render json: item
    else
      render :file => 'public/404.html'
    end
  end

  def destroy
    id = params[:id]
    item_destroy(id)
  end

  private
    def all_items
      Item.all
    end

    def single_item(id)
      Item.find_by(id: id)
    end

    def safe_params
      params.require(:item).permit(:name, :description, :image_url)
    end

    def item_destroy(item_id)
      Item.find(item_id).destroy
    end
end
