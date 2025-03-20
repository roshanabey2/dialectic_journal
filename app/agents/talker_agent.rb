class TalkerAgent < ApplicationAgent
  def respond
    @message = "Cats go.."

    prompt message: @message
  end

  def relay
    @message = "Cats go.."

    prompt message: @message
  end
end
