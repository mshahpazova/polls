require 'rails_helper'

RSpec.describe CanVoteService do
  let(:poll) { create(:poll) }
  let(:option) { create(:option, poll: poll) }
  let!(:vote) { create(:vote, option: option) }

  let(:can_vote_service) { subject }

  context 'when vote for poll' do
    it 'user cannot vote again for the same poll' do
      cannot_vote = can_vote_service.already_voted?(voter: 'maria', poll_id: poll.id)
      expect(cannot_vote).to eq true
    end

    it 'user can vote for poll' do
      cannot_vote = can_vote_service.already_voted?(voter: 'ivan', poll_id: poll.id)
      expect(cannot_vote).to eq false
    end
  end
end