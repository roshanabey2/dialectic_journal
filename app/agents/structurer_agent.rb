class StructurerAgent < ApplicationAgent
  def condense
    @message = "Cats go.."

    prompt message: @message
  end

  def format
    @message = "Cats go.."

    prompt message: @message
  end

  def return
    @message = "Cats go.."

    prompt message: @message
  end
end
