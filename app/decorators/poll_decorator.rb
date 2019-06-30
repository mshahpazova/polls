class PollDecorator
  def initialize(poll)
    @poll = poll
  end

  def votes(option)
    number_of_votes = option.votes.size
    votes_percent =
      if @poll.votes.size != 0
        (number_of_votes.to_f / @poll.votes.size) * 100
      else
        0
      end
    "voted: #{number_of_votes} times, #{votes_percent.to_i}%"
  end
end