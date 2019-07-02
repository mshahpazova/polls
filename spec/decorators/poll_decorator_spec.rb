require 'rails_helper'

RSpec.describe PollDecorator do
  let(:poll) { create(:poll) }
  let!(:option1) { create(:option, poll: poll) }
  let!(:option2) { create(:option, poll: poll) }

  subject { described_class.new(poll) }

  context 'percentage calculation' do

    it 'returns the number of votes for an option' do
      create(:vote, option: option1)

      expect(subject.number_of_votes(option1)).to eq 1
    end

    it 'returns 100% for an option when everybody has voted for it' do
      create(:vote, option: option1)

      expect(subject.votes_percentage(option1)).to eq 100
    end

    it 'returns 0% for an option when nobody has voted for it' do
      expect(subject.votes_percentage(option1)).to eq 0
    end

    it 'returns 50% for an option when it has half of the votes' do
      create(:vote, option: option1)
      create(:vote, option: option2)

      expect(subject.votes_percentage(option1)).to eq 50
    end
  end
end

