require 'rails_helper'

RSpec.describe CanVoteService do
  let(:poll) { create(:poll) }
  let(:option) { create(:option, poll: poll) }
  let!(:vote) { create(:vote, option: option, user_id: 'maria') }

  context 'when vote for poll' do
    it 'user cannot vote again for the same poll' do
      already_voted = CanVoteService.already_voted?(voter: 'maria', poll_id: poll.id)
      expect(already_voted).to eq true
    end

    it 'user can vote for poll' do
      already_voted = CanVoteService.already_voted?(voter: 'ivan', poll_id: poll.id)
      expect(already_voted).to eq false
    end
  end
end