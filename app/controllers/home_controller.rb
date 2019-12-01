class HomeController < ApplicationController
  include HomeHelper

  def index
    @intent = voice_assistant.calculate_intent_of(params[:phrase])
  end

  def create
    redirect_to("/?phrase=#{params[:phrase]}")
  end
end
