class CanVoteService
  def already_voted?(voter:, poll_id:)
    Poll.find(poll_id).votes.where(user_id: voter).size != 0
  end
end