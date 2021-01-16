class ComicsController < ApplicationController
  def index
    comics_interactor = ComicBooks::List.(comics_params)
    resources = comics_interactor.resources
    pagination_data = comics_interactor.pagination_data
    json_data = ComicBookSerializer
      .new(resources, links: pagination_data)
      .serializable_hash
      .to_json

    respond_to do |format|
      format.json { render json: json_data }
    end
  end

  private

  def comics_params
    params.slice(:page, :query)
  end
end
