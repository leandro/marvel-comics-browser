require 'digest'

module MarvelApi
  class Request
    API_PATHS = {
      character_comics: '/v1/public/characters/%{character_id}/comics',
      characters: '/v1/public/characters',
      comics: '/v1/public/comics'
    }

    BASE_URL = 'https://gateway.marvel.com'
    PAGE_SIZE = Pagination::PAGE_SIZE
    PRIVATE_KEY = Rails.application.credentials.marvel_api[:private_key]
    PUBLIC_KEY = Rails.application.credentials.marvel_api[:public_key]

    attr_reader :page, :page_size

    def initialize(page, page_size = PAGE_SIZE)
      @page = page
      @page_size = page_size
    end

    def characters(character_name)
      perform_request(url_for(:characters), name: character_name)
    end

    def comics(order = '-focDate')
      perform_request(url_for(:comics), pagination_params.merge(orderBy: order))
    end

    def comics_by_character(character_name)
      response = characters(character_name)

      return {} unless response.has_entries?

      character_id = response.entries.first['id']

      perform_request(
        url_for(:character_comics, character_id: character_id),
        pagination_params.merge(orderBy: '-focDate')
      )
    end

    private

    def auth_params
      {
        ts: request_id,
        apikey: PUBLIC_KEY,
        hash: Digest::MD5.hexdigest(hashable_data)
      }
    end

    def pagination_params
      {
        limit: page_size,
        offset: offset(page, page_size)
      }
    end

    def full_url(path, params)
      url_components = {
        base: BASE_URL,
        path: path,
        query_string: query_string(params)
      }

      '%{base}%{path}?%{query_string}' % url_components
    end

    def hashable_data
      "#{request_id}#{PRIVATE_KEY}#{PUBLIC_KEY}"
    end

    def offset(page, page_size)
      (page - 1) * page_size
    end

    def url_for(url_type, params = {})
      API_PATHS[url_type] % params
    end

    def perform_request(path, params = {})
      Response.new(HTTParty.get(full_url(path, params)))
    end

    def query_string(params)
      auth_params.merge(params).to_query
    end

    def request_id
      @request_id ||= Time.new.to_f
    end
  end
end
