module Presenters
  class Base < SimpleDelegator
    attr_reader :params

    def initialize(model, params)
      super(model)
      @params = params
    end

    def debug?
      params[:debug].present?
    end

    def data
      @data ||= api_response
    end

    def titles
      @titles ||= data[:detected_entities].uniq.select{ |e|
        e[:entity_type_name] == 'titles' && e.dig(:metadata, 'poster') != 'N/A'
      }.sort_by{ |t| t.dig(:metadata, 'imdb_rating') }.reverse
    end

    def has_results?
      data[:intent_name] != "unknown" && data[:detected_entities].present?
    end

  end
end
