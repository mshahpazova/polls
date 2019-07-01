class PollDecorator
  def initialize(poll)
    @poll = poll
  end

  def number_of_votes(option)
    option.votes.size
  end

  def votes_percentage(option)
    if @poll.votes.size != 0
    (100.0 * number_of_votes(option) / @poll.votes.size).to_i
    else
    0
    end
  end
end

