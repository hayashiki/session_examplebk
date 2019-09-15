require 'rails_helper'

RSpec.describe Task, type: :model do
  it 'has a valid factory' do
    expect(create :task).to be_valid
  end  
end
