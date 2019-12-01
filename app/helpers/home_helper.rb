module HomeHelper
  def voice_assistant
    @voice_assistant ||= Epiphany::VoiceAssistant.first
  end
end
