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

    def query
      context.query.to_s.strip
    end

    def request_url
      params = { page: '%s' }.merge(query.blank? ? {} : { query: query })

      URI.decode(
        Rails
          .application
          .routes.url_helpers
          .comics_path(params)
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
      comics_api_response.entries_total
    end

    def comics
      comics_api_response.entries
    end

    def comics_api_response
      @comics_api_response ||=
        if query.present?
          MarvelApi::Request.new(page).comics_by_character(query)
        else
          MarvelApi::Request.new(page).comics
        end
    end
  end
end
