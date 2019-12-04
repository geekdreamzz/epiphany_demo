class HomeController < ApplicationController
  include HomeHelper
  before_action :omdb_cache_warmer

  def index
    @presenter = Presenters::Base.new(voice_assistant.calculate_intent_of(params[:phrase]), intent_params) if params[:phrase]
  end

  def create
    redirect_to("/?phrase=#{params[:phrase]}")
  end

  def omdb_cache_warmer
    return true if params[:cache_off]
    return true if Rails.env.production? && Epiphany::TrainingPhrase.exist?(phrase: params[:phrase])
    if params[:phrase]
      Epiphany::Tokenizer::Fragmenter.fragmenter(params[:phrase]) do |phrase|
        OmdbClient.search(phrase)
      end
    end
  end

  private
  def intent_params
    params.permit(:debug, :phrase)
  end
end
