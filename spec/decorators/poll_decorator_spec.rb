require 'rails_helper'

RSpec.describe PollDecorator do
  let(:poll) { create(:poll) }
  let!(:option1) { create(:option, poll: poll) }
  let!(:option2) { create(:option, poll: poll) }

  subject {described_class.new(poll)}

  context 'percentage calculation' do
    it 'returns 100% when everybody has voted for it' do
      create(:vote, option: option1)

      expect(subject.number_of_votes(option1)).to eq 1
      expect(subject.votes_percentage(option1)).to eq 100
    end
    it 'returns 0% when nobody has voted for it' do
      expect(subject.number_of_votes(option1)).to eq 0
      expect(subject.votes_percentage(option1)).to eq 0
    end

    it 'returns 50% when half of the votes is for it' do
      #when 1 vote for option1 and 1 for option2
      create(:vote, option: option1)
      create(:vote, option: option2)

      #then both options have 50%
      expect(subject.number_of_votes(option1)).to eq 1
      expect(subject.number_of_votes(option2)).to eq 1
      expect(subject.votes_percentage(option1)).to eq 50
      expect(subject.votes_percentage(option2)).to eq 50
    end
  end
end

