module ComicBooks
  class List
    include Interactor

    def call
      context.resources = comics.map { |comic| ComicBook.new(comic) }
      context.pagination_data = pagination_data
    end

    private

    def page
      (context.page || 1).to_i
    end

    def request_url
      URI.decode(
        Rails
          .application
          .routes.url_helpers
          .comics_path(page: '%s')
      )
    end

    def pagination_data
      paginator.to_json_api_params
    end

    def paginator
      @paginator ||= Pagination.new(
        page: page,
        url_template: request_url,
        total: total_entries
      )
    end

    def total_entries
      comics_from_api.dig('data', 'total')
    end

    def comics
      comics_from_api.dig('data', 'results')
    end

    def comics_from_api
      @comics_from_api ||= MarvelApi.new.comics(page: page)
    end
  end
end
