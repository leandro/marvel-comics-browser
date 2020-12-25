class HomeController < ApplicationController
  def index
  end

  def comics
    comics_interactor = ComicBooks::List.(page: params[:page])
    resources = comics_interactor.resources
    pagination_data = comics_interactor.pagination_data
    json_data = ComicBookSerializer
      .new(resources, links: pagination_data)
      .serializable_hash
      .to_json

    render json: json_data
  end
end
