class OmdbClient
  API_KEY = ENV['OMDB_API_KEY']

  class << self
    def client
      @client ||= Omdb::Api::Client.new(api_key: API_KEY)
    end

    def search(query)
      epiphany_cache client.search(query)
    end

    def epiphany_cache(results)
      results.movies.each do |m|
        # we're manually caching data but perhaps in future versions we can be more elegant and automated
        # but while in alpha I want to get the data into the system so I can later demo
        # tokenizing "natural language queries" to detect entity types & items that exist in the database
        media = client.find_by_id(m.imdb_id)

        # caches the movie information
        voice_assistant.entity_types.find_by_name('titles').create_or_add_item_w([media.title], media.as_json.to_json)

        # caches known genre types for the whole system
        media.genre.split(',').each do |genre_name|
          voice_assistant.entity_types.find_by_name('genres').create_or_add_item_w([genre_name], {})
        end

        # caches known actors for the whole system
        media.actors.split(',').each do |actor_name|
          voice_assistant.entity_types.find_by_name('actors').create_or_add_item_w([actor_name], {})
        end

        # caches known directors for the whole system
        voice_assistant.entity_types.find_by_name('directors').create_or_add_item_w([media.director], {})
      end
    end

    def voice_assistant
      @voice_assistant ||= Epiphany::VoiceAssistant.find_by_name('Epiphany') # or w/e name you used
    end
  end
end
