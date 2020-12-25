class Pagination
  PAGE_SIZE = 20

  attr_reader :page, :page_size, :total, :url_template

  def initialize(total:, page: 1, page_size: PAGE_SIZE, url_template: '')
    @page = page
    @page_size = page_size
    @total = total
    @url_template = url_template
  end

  def to_json_api_params
    {
      self: page,
      prev: has_previous_page? ? page - 1 : nil,
      next: has_next_page? ? page + 1 : nil
    }.reduce({}) do |params, (k, v)|
      v ? params.merge(k => url_template % [v, page_size]) : params
    end
  end

  private

  def has_next_page?
    page_size * page < total
  end

  def has_previous_page?
    page > 1
  end
end
