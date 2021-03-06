module MarvelApi
  class Response
    attr_reader :entries, :entries_count, :entries_total

    def initialize(http_response)
      @response = http_response
      @entries = has_entries? && data['results'] || []
      @entries_count = has_entries? && data['count'] || 0
      @entries_total = has_entries? && data['total'] || 0
    end

    def has_entries?
      success? && data['count'] > 0
    end

    private

    attr_reader :response

    def data
      response['data']
    end

    def success?
      response['code'] == 200
    end
  end
end
