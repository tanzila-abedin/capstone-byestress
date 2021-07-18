require 'rails_helper'

RSpec.describe Micropost, type: :model do
  it 'validates presence of the content' do
    content = Micropost.new(content: nil)
    expect(content).to_not be_valid
  end

  it 'validates maximum content character' do
    content = 'a' * 300
    post = Micropost.new(content: content)
    expect(post).to_not be_valid
  end

  it 'should belong to user' do
    user = Micropost.reflect_on_association(:user)
    expect(user.macro).to eq(:belongs_to)
  end

  it 'has many likes' do
    like = Micropost.reflect_on_association(:likes)
    expect(like.macro).to eq(:has_many)
  end
end
