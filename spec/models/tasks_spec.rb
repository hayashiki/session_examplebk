require 'rails_helper'

RSpec.describe Task, type: :model do
  it 'has a valid factory' do
    expect(create :task).to be_valid
  end 

  describe 'associations' do
    it { is_expected.to belong_to(:user) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_length_of(:name).is_at_most(500) }
  end
end
