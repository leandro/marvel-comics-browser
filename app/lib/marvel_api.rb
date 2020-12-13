require 'digest'

class MarvelApi
  API_PATHS = {
    comics: '/v1/public/comics'
  }

  BASE_URL = 'https://gateway.marvel.com'
  PAGE_SIZE = 20
  PRIVATE_KEY = Rails.application.credentials.marvel_api[:private_key]

  PARAMS_MAP = {
    order: :orderBy
  }

  PUBLIC_KEY = Rails.application.credentials.marvel_api[:public_key]

  def comics(order: '-focDate', page: 1, page_size: PAGE_SIZE)
    kwargs = extract_kwargs(binding, %i(order page page_size))

    perform_request(API_PATHS[:comics], convert_params(kwargs))
  end

  private

  def auth_params
    {
      ts: request_id,
      apikey: PUBLIC_KEY,
      hash: Digest::MD5.hexdigest(hashable_data)
    }
  end

  def convert_params(params)
    pagination_params = {
      limit: params[:page_size],
      offset: offset(params[:page], params[:page_size])
    }

    params.except(*%i(page page_size)).reduce({}) do |memo, (key, value)|
      next memo unless key = PARAMS_MAP[key]

      memo.update(key => value)
    end.merge(pagination_params)
  end

  def extract_kwargs(binding, kwargs_keys)
    (binding.local_variables & kwargs_keys).reduce({}) do |kwargs, kwarg_key|
      kwargs.update(kwarg_key => binding.local_variable_get(kwarg_key))
    end
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

  def perform_request(path, params = {})
    HTTParty.get(full_url(path, params))
  end

  def query_string(params)
    auth_params.merge(params).to_query
  end

  def request_id
    @request_id ||= Time.new.to_f
  end
end
